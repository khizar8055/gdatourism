
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gda_tourism/core/constants/app_colors.dart';
import 'package:gda_tourism/core/widgets/gda_header.dart';
import '../../../../services/tourism_api_service.dart';
import 'add_hotel_screen.dart';
import 'add_hospital_screen.dart';
import 'add_petrol_pump_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  bool _isLoading = true;
  Map<String, int> _stats = {
    'hotels': 0,
    'hospitals': 0,
    'petrolPumps': 0,
  };

  @override
  void initState() {
    super.initState();
    _fetchStats();
  }

  Future<void> _fetchStats() async {
    setState(() => _isLoading = true);
    try {
      final api = TourismApiService();
      final hotels = await api.getHotels();
      final hospitals = await api.getHospitals();
      final petrolPumps = await api.getFuelPumps();
      setState(() {
        _stats = {
          'hotels': hotels.length,
          'hospitals': hospitals.length,
          'petrolPumps': petrolPumps.length,
        };
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading stats: $e'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: Column(
        children: [
          GdaHeaderBar(
            title: 'Admin Dashboard',
            subtitle: 'Content Management',
            showBackButton: true,
            onBackPressed: () => Navigator.maybePop(context),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.refresh_rounded,
                  color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextOnPrimary,
                ),
                onPressed: _fetchStats,
              ),
            ],
          ),
          Expanded(
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(color: colorScheme.primary),
                  )
                : RefreshIndicator(
                    onRefresh: _fetchStats,
                    color: colorScheme.primary,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Overview',
                            style: GoogleFonts.manrope(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Manage tourism data across Galiyat regions',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: colorScheme.onSurface.withValues(alpha: 0.65),
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildStatsGrid(context),
                          const SizedBox(height: 28),
                          Text(
                            'Quick Actions',
                            style: GoogleFonts.manrope(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildQuickActions(context),
                          const SizedBox(height: 28),
                          Text(
                            'Manage Data',
                            style: GoogleFonts.manrope(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildManageData(context),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final stats = [
      {
        'title': 'Hotels',
        'count': _stats['hotels'],
        'icon': Icons.hotel_rounded,
        'color': colorScheme.primary,
      },
      {
        'title': 'Hospitals',
        'count': _stats['hospitals'],
        'icon': Icons.local_hospital_rounded,
        'color': colorScheme.error,
      },
      {
        'title': 'Fuel Stations',
        'count': _stats['petrolPumps'],
        'icon': Icons.local_gas_station_rounded,
        'color': isDark ? AppColors.darkTertiaryInfo : AppColors.lightTertiaryInfo,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.95,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final stat = stats[index];
        return _buildStatCard(
          context,
          stat['title'] as String,
          stat['count'] as int,
          stat['icon'] as IconData,
          stat['color'] as Color,
        );
      },
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    int count,
    IconData icon,
    Color color,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 26, color: color),
          ),
          const SizedBox(height: 10),
          Text(
            count.toString(),
            style: GoogleFonts.manrope(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface.withValues(alpha: 0.65),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final actions = [
      {
        'title': 'Add Hotel',
        'icon': Icons.add_business_rounded,
        'screen': const AddHotelScreen(),
      },
      {
        'title': 'Add Hospital',
        'icon': Icons.local_hospital_rounded,
        'screen': const AddHospitalScreen(),
      },
      {
        'title': 'Add Fuel Station',
        'icon': Icons.local_gas_station_rounded,
        'screen': const AddPetrolPumpScreen(),
      },
    ];

    return Column(
      children: actions
          .map(
            (action) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _buildQuickActionCard(
                context,
                action['title'] as String,
                action['icon'] as IconData,
                action['screen'] as Widget,
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildQuickActionCard(
    BuildContext context,
    String title,
    IconData icon,
    Widget screen,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: colorScheme.primary, size: 24),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              Icon(
                Icons.add_circle_outline_rounded,
                color: colorScheme.primary,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildManageData(BuildContext context) {
    final items = [
      {'title': 'Manage Hotels', 'type': 'hotel', 'icon': Icons.hotel_rounded},
      {
        'title': 'Manage Hospitals',
        'type': 'hospital',
        'icon': Icons.local_hospital_rounded,
      },
      {
        'title': 'Manage Fuel Stations',
        'type': 'petrolPump',
        'icon': Icons.local_gas_station_rounded,
      },
    ];

    return Column(
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _buildManageListItem(
                context,
                item['title'] as String,
                item['type'] as String,
                item['icon'] as IconData,
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildManageListItem(
    BuildContext context,
    String title,
    String type,
    IconData icon,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ManageListScreen(type: type),
            ),
          );
        },
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: colorScheme.primary, size: 24),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: colorScheme.onSurface.withValues(alpha: 0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ManageListScreen extends StatefulWidget {
  final String type;

  const ManageListScreen({super.key, required this.type});

  @override
  State<ManageListScreen> createState() => _ManageListScreenState();
}

class _ManageListScreenState extends State<ManageListScreen> {
  bool _isLoading = true;
  List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() => _isLoading = true);
    try {
      final api = TourismApiService();
      List<Map<String, dynamic>> data;
      switch (widget.type) {
        case 'hotel':
          data = await api.getHotels();
          break;
        case 'hospital':
          data = await api.getHospitals();
          break;
        case 'petrolPump':
          data = await api.getFuelPumps();
          break;
        default:
          data = [];
      }
      setState(() => _items = data);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading data: $e'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  String get _appBarTitle {
    switch (widget.type) {
      case 'hotel':
        return 'Manage Hotels';
      case 'hospital':
        return 'Manage Hospitals';
      case 'petrolPump':
        return 'Manage Fuel Stations';
      default:
        return 'Manage';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: Column(
        children: [
          GdaHeaderBar(
            title: _appBarTitle,
            showBackButton: true,
            onBackPressed: () => Navigator.pop(context),
          ),
          Expanded(
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(color: colorScheme.primary),
                  )
                : _items.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.inbox_rounded,
                              size: 64,
                              color: colorScheme.onSurface.withValues(alpha: 0.3),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No items found',
                              style: GoogleFonts.manrope(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: colorScheme.onSurface.withValues(alpha: 0.6),
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          final item = _items[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: colorScheme.surface,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                              ),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6,
                              ),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                  width: 56,
                                  height: 56,
                                  child: item['cover_image_url'] != null &&
                                          item['cover_image_url'].isNotEmpty
                                      ? Image.network(
                                          TourismApiService.getImageUrl(
                                            item['cover_image_url'],
                                          ),
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              color: colorScheme.surfaceContainerHighest,
                                              child: Icon(
                                                Icons.image_rounded,
                                                color: colorScheme.onSurface
                                                    .withValues(alpha: 0.4),
                                              ),
                                            );
                                          },
                                        )
                                      : Container(
                                          color: colorScheme.surfaceContainerHighest,
                                          child: Icon(
                                            Icons.image_rounded,
                                            color: colorScheme.onSurface
                                                .withValues(alpha: 0.4),
                                          ),
                                        ),
                                ),
                              ),
                              title: Text(
                                item['name'] ?? 'Unknown',
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              subtitle: Text(
                                item['district'] ?? 'No district',
                                style: GoogleFonts.inter(fontSize: 13),
                              ),
                              trailing: Icon(
                                Icons.chevron_right_rounded,
                                color: colorScheme.onSurface.withValues(alpha: 0.4),
                              ),
                              onTap: () {},
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
