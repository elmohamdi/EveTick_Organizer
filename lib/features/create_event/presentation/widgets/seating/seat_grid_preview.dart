import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/create_event/data/models/seat_status.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/seating/seat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Renders a cinema / stadium style seat map with:
///
/// 1. A curved "SCREEN" bar at the top.
/// 2. A center aisle splitting every row into left and right sections.
/// 3. A fan/arc effect - front rows are narrower (more side padding),
///    back rows gradually widen out.
/// 4. A horizontal walkway separator every [_walkwayEveryNRows] rows.
/// 5. Dynamic seat sizing so 9+ seats per row never overflow.
///
/// Wrapped in [InteractiveViewer] for pinch-to-zoom. Tapping a seat
/// toggles it between available and unavailable via [onSeatTap].
class SeatGridPreview extends StatefulWidget {
  const SeatGridPreview({
    super.key,
    required this.seatMap,
    required this.onSeatTap,
  });

  final List<List<SeatStatus>> seatMap;
  final void Function(int rowIndex, int seatIndex) onSeatTap;

  @override
  State<SeatGridPreview> createState() => _SeatGridPreviewState();
}

class _SeatGridPreviewState extends State<SeatGridPreview> {
  final TransformationController _transformationController =
      TransformationController();

  /// Insert a horizontal walkway gap every N rows.
  static const int _walkwayEveryNRows = 4;

  /// Width of the aisle gap in the center (logical pixels).
  static const double _aisleGap = 14;

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  void _zoom(double factor) {
    final current = _transformationController.value;
    final scaleMatrix = Matrix4.diagonal3Values(factor, factor, 1.0);
    _transformationController.value = current * scaleMatrix;
  }

  void _resetZoom() {
    _transformationController.value = Matrix4.identity();
  }

  String _rowLabel(int index) => String.fromCharCode(65 + index); // A, B, C...

  @override
  Widget build(BuildContext context) {
    final int totalRows = widget.seatMap.length;
    final int seatsPerRow = widget.seatMap.isEmpty
        ? 0
        : widget.seatMap.first.length;

    // Estimate width to calculate a dynamic height that fits the rows
    final double screenWidth = MediaQuery.of(context).size.width;
    final double estimatedCellWidth = seatsPerRow > 0
        ? (screenWidth - 40 - 20 - _aisleGap) / seatsPerRow
        : 28;
    final double estimatedSeatSize = (estimatedCellWidth / 1.22).clamp(
      24.0,
      36.0,
    );
    final int walkways = totalRows > 0
        ? (totalRows - 1) ~/ _walkwayEveryNRows
        : 0;
    final double requiredHeight =
        (totalRows * estimatedSeatSize * 1.5) + (walkways * 30) + 120;
    final double containerHeight = requiredHeight.clamp(300.0, 700.0);

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.fourthBlue,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          // ---------- Curved SCREEN bar ----------
          _CurvedScreenBar(),

          verticalSpace(16),

          // ---------- Seat map ----------
          SizedBox(
            height: containerHeight,
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Available width for the widest row (the last row)
                final double availableWidth = constraints.maxWidth;
                const double rowLabelWidth = 20;

                // Compute dynamic seat size so the widest row fits.
                final double maxCellWidth = seatsPerRow > 0
                    ? (availableWidth - rowLabelWidth - _aisleGap) / seatsPerRow
                    : 28;
                // Minimum size increased to 24.0 so seats don't become microscopic.
                // This guarantees horizontal panning works and is useful for many seats.
                final double computedSize = (maxCellWidth / 1.22).clamp(
                  24.0,
                  36.0,
                );

                return InteractiveViewer(
                  transformationController: _transformationController,
                  minScale: 0.5,
                  maxScale: 3,
                  boundaryMargin: EdgeInsets.all(80.w),
                  constrained:
                      false, // Allows panning without RenderFlex overflow
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    alignment: Alignment.center,
                    child: IntrinsicWidth(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (int r = 0; r < totalRows; r++) ...[
                            // --- Walkway separator ---
                            if (r > 0 && r % _walkwayEveryNRows == 0)
                              _WalkwaySeparator(),

                            // --- Seat row with fan effect ---
                            _buildSeatRow(
                              context: context,
                              rowIndex: r,
                              totalRows: totalRows,
                              computedSeatSize: computedSize,
                              availableWidth: availableWidth,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          verticalSpace(12),

          // ---------- Zoom controls ----------
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _ZoomButton(icon: Icons.add, onTap: () => _zoom(1.2)),
              horizontalSpace(8),
              _ZoomButton(icon: Icons.remove, onTap: () => _zoom(0.8)),
              horizontalSpace(8),
              _ZoomButton(icon: Icons.crop_free, onTap: _resetZoom),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds one seat row with a center aisle and fan-shaped side padding.
  ///
  /// The fan effect works by applying extra horizontal padding to the front
  /// rows that decreases linearly towards the back rows. The last row gets
  /// no extra padding (full width) while the first row gets the most.
  Widget _buildSeatRow({
    required BuildContext context,
    required int rowIndex,
    required int totalRows,
    required double computedSeatSize,
    required double availableWidth,
  }) {
    final seats = widget.seatMap[rowIndex];
    final int seatCount = seats.length;

    // --- Fan / arc padding ---
    // Front rows get up to maxFanPadding on each side, decreasing to 0.
    final double maxFanPadding = (availableWidth * 0.12).clamp(10.0, 40.0);
    final double fanPadding = totalRows > 1
        ? maxFanPadding * (1 - rowIndex / (totalRows - 1))
        : 0;

    // --- Split seats into left and right around center aisle ---
    final int leftCount = seatCount ~/ 2;
    // leftSeats = 0..leftCount-1, rightSeats = leftCount..seatCount-1

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: fanPadding),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Row label
          SizedBox(
            width: 20,
            child: Text(
              _rowLabel(rowIndex),
              style: TextStyles.font12LightGrayRegular(context),
            ),
          ),

          // Left section
          for (int s = 0; s < leftCount; s++)
            SeatWidget(
              seatSize: computedSeatSize,
              status: seats[s],
              onTap: () => widget.onSeatTap(rowIndex, s),
            ),

          // Center aisle gap
          SizedBox(width: _aisleGap),

          // Right section
          for (int s = leftCount; s < seatCount; s++)
            SeatWidget(
              seatSize: computedSeatSize,
              status: seats[s],
              onTap: () => widget.onSeatTap(rowIndex, s),
            ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Private helper widgets
// ---------------------------------------------------------------------------

/// Curved screen bar that mimics a real cinema screen shape.
class _CurvedScreenBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _ScreenCurveClipper(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.colors.darkBlue,
              context.colors.darkBlue.withValues(alpha: 0.7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Text('SCREEN', style: TextStyles.font16WhiteBold(context)),
        ),
      ),
    );
  }
}

/// Clips the bottom edge of the SCREEN bar into a gentle upward curve,
/// giving the look of a real cinema screen.
class _ScreenCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.65)
      ..quadraticBezierTo(
        size.width / 2,
        size.height * 1.1,
        size.width,
        size.height * 0.65,
      )
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

/// A thin dashed line that represents a walkway / horizontal aisle
/// between groups of rows.
class _WalkwaySeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          Expanded(
            child: CustomPaint(
              size: Size(double.infinity, 1),
              painter: _DashedLinePainter(
                color: context.colors.lightGray.withValues(alpha: 0.3),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              'WALKWAY',
              style: TextStyles.font12LightGrayRegular(
                context,
              ).copyWith(fontSize: 8.sp, letterSpacing: 2),
            ),
          ),
          Expanded(
            child: CustomPaint(
              size: Size(double.infinity, 1),
              painter: _DashedLinePainter(
                color: context.colors.lightGray.withValues(alpha: 0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Simple dashed-line painter for walkway separators.
class _DashedLinePainter extends CustomPainter {
  _DashedLinePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    const dashWidth = 4.0;
    const dashSpace = 3.0;
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset((startX + dashWidth).clamp(0, size.width), size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedLinePainter oldDelegate) =>
      color != oldDelegate.color;
}

/// Zoom control button.
class _ZoomButton extends StatelessWidget {
  const _ZoomButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: context.colors.thirdBlue,
          shape: BoxShape.circle,
          border: Border.all(
            color: ColorsManager.orange.withValues(alpha: 0.4),
          ),
        ),
        child: Icon(icon, size: 18.sp, color: context.colors.white),
      ),
    );
  }
}
