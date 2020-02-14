terraform {
  backend "gcs" {
    bucket      = "mmmh-studio-tf-states"
    prefix      = "validator"
    credentials = "../public/public-56e58bf0425e.json"
  }
}

# module "upcloud" {
#   # source = "git::https://github.com/mmmh-studio/terraform-provider-upcloud.git?rev=xla/network"
#   source = "git::https://github.com/mmmh-studio/terraform-provider-upcloud.git"
# }

provider "upcloud" {}

resource "upcloud_network" "kernel" {
  zone    = "de-fra1"
  name    = "kernel"
  dhcp    = true
  address = "10.0.0.0/22"
  family  = "IPv4"
}

resource "upcloud_server" "sentry" {
  zone     = "de-fra1"
  hostname = "sentry00"

  cpu = 2
  mem = 1024

  network_interface {
    type    = "private"
    network = upcloud_network.kernel.name
    family  = "IPv4"
    # dhcp    = true
  }

  login {
    user = "xla"
    keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDNh/rjW/SnV/6vqtEyxc+zCSYYJTbjxrGRLLeULLnFcgAh58NHJb3JA22w0R0LU8Z2WRBsuiFIcyXtB+/nPAZqlfRHvrA0EQ8BrQ7t7SS14PlSVMNm0eUakwP2h4XzDb2r+0PNiHssFtKCxegH4Z1OKu2xMtVgEpFZRcyMCkoNbrGG8S7jtZdrEmUf7igjO06jmiOQpX6ETiziv+78ROurQI2HhXfCXEI7WCEi7U6cr83nNLKd2H86b05xbm9sA8ZksWX6+uNsIKJdaRcRfH3GNVR2SCiFUJjgz0JFMTMkOWHNDvV2IHtnAB/j8PwyNv+HS8KH2oI7WWLVn6smov6EbEXs/HLjrzoWbx0C67QXaC9NzkldjFgtY1DLv32QmpnUs9tJ0P2WggyrcgVQO1yWQd03l9gWYCq1zt1iiWAC8X+YWINPGwqGxdhq5pUNnGtjITRl4Qp63Q6ZXjelMBtjbrf2vnj2a7tJz3rrGPwrVxXc15zahyWGIMuhSTHvy0xiFtcodyui0snlkwNSKniyd7YbJxVOfxujly/anBasrluzQP8VQeyKY3CHhxBGJnj+mDF9Kr21ny60Q8dN6fVmtHQTG/IAo3MEqvVLHgcu/P4vSWqKsLofP0Ie3MGO2PjfIMz+jsD+yoPVe0QwZDVJArIXK81LDu026k7k6orZzQ== a.simmerl@gmail.com"
    ]

    create_password   = true
    password_delivery = "email"
  }

  storage_devices {
    size   = 10
    action = "create"
    tier   = "maxiops"
  }
}

# resource "upcloud_tag" "sentry" {
#   name        = "sentry"
#   description = "Full nodes publicly exposed."

#   servers = [
#     upcloud_server.sentry.id
#   ]
# }

# output "public_ip" {
#   value = upcloud_server.sentry.ipv4_address
# }
