moved {
  from = google_compute_network.vpc
  to   = module.network.google_compute_network.vpc
}

moved {
  from = google_compute_subnetwork.public
  to   = module.network.google_compute_subnetwork.public
}

moved {
  from = google_compute_subnetwork.private
  to   = module.network.google_compute_subnetwork.private
}

moved {
  from = google_compute_subnetwork.database
  to   = module.network.google_compute_subnetwork.database
}

moved {
  from = google_compute_subnetwork.management
  to   = module.network.google_compute_subnetwork.management
}

moved {
  from = google_compute_router.router
  to   = module.network.google_compute_router.router
}

moved {
  from = google_compute_router_nat.nat
  to   = module.network.google_compute_router_nat.nat
}

moved {
  from = google_compute_firewall.allow-ssh
  to   = module.network.google_compute_firewall.allow_ssh
}

moved {
  from = google_compute_firewall.allow_http_https
  to   = module.network.google_compute_firewall.allow_http_https
}

moved {
  from = google_compute_firewall.allow_internal
  to   = module.network.google_compute_firewall.allow_internal
}