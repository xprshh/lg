{ ... }:
{
  boot.kernel.sysctl = {
    "vm.dirty_ratio" = 20;
    "vm.dirty_background_ratio" = 10;
    "vm.vfs_cache_pressure" = 25;
    "net.core.default_qdisc" = ''cake'';
    "net.ipv4.tcp_congestion_control" = ''bbr'';
    "vm.page-cluster" = 1;
    "kernel.nmi_watchdog" = 0;
    "vm.swappiness" = 200;
    "vm.max_map_count" = 2147483642;
    "vm.watermark_boost_factor" = 1;
    "vm.watermark_scale_factor" = 1000;
    "vm.nr_hugepages" = 512;
    "vm.hugetlb_optimize_vmemmap" = 1;
    "net.core.netdev_max_backlog" = 32768;
    "net.core.somaxconn" = 16384;
    "net.core.rmem_default" = 1048576;
    "net.core.rmem_max" = 16777216;
    "net.core.wmem_default" = 1048576;
    "net.core.wmem_max" = 16777216;
    "net.core.optmem_max" = 65536;
    "net.ipv4.tcp_rmem" = ''4096 1048576 2097152'';
    "net.ipv4.tcp_wmem" = ''4096 65536 16777216'';
    "net.ipv4.udp_rmem_min" = 16384;
    "net.ipv4.udp_wmem_min" = 16384;
    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.tcp_max_syn_backlog" = 32768;
    "net.ipv4.tcp_max_tw_buckets" = 2000000;
    "net.ipv4.tcp_fin_timeout" = 10;
    "net.ipv4.tcp_slow_start_after_idle" = 0;
    "net.ipv4.tcp_keepalive_time" = 60;
    "net.ipv4.tcp_keepalive_intvl" = 10;
    "net.ipv4.tcp_keepalive_probes" = 6;
    "net.ipv4.tcp_mtu_probing" = 1;
    "net.ipv4.ip_local_port_range" = ''30000 65535'';
  };
}
