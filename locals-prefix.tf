locals {
  tg64 = {
    version = "1.0.0"
    compute = {
      instance = "g-ci"
    }
    storage = {
      bucket = "g-sbk"
    }
    iam = {
      service_account = "g-isa"
    }
    datacenter   = "g-dc"
    project      = "g-prj"
    folder       = "g-fld"
    organization = "g-org"
    gke = {
      cluster = "g-kec"
    }
    kms = {
      key  = "g-kky"
      ring = "g-krn"
    }
    vpc = {
      firewall   = "g-vfw"
      network    = "g-vnw"
      route      = "g-vrt"
      subnetwork = "g-vsn"
    }
  }
}
