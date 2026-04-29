vrfs = [
  {
    name                   = "Blue_VRF"
    default_route_next_hop = "10.0.10.254"
    default_route_leaf     = ["Border1", "Border2"]
  },
  {
    name                   = "Red_VRF"
    default_route_next_hop = "10.0.20.254"
    default_route_leaf     = ["Border1", "Border2"]
  },
]

vns = [
  {
    name                 = "Vlan-100"
    vlan_id              = 100
    vrf_name             = "Blue_VRF"
    ipv4_virtual_gateway = "10.0.100.1"
    ipv4_subnet          = "10.0.100.0/24"
    bindings             = ["Leaf1"]
  },
  {
    name                 = "Vlan-200"
    vlan_id              = 200
    vrf_name             = "Red_VRF"
    ipv4_virtual_gateway = "10.0.200.1"
    ipv4_subnet          = "10.0.200.0/24"
    bindings             = ["Leaf1"]
  },
  {
    name                 = "Vlan-10"
    vlan_id              = 10
    vrf_name             = "Blue_VRF"
    ipv4_virtual_gateway = "10.0.10.1"
    ipv4_subnet          = "10.0.10.0/24"
    bindings             = ["Border1"]
  },
  {
    name                 = "Vlan-20"
    vlan_id              = 20
    vrf_name             = "Red_VRF"
    ipv4_virtual_gateway = "10.0.20.1"
    ipv4_subnet          = "10.0.20.0/24"
    bindings             = ["Border1"]
  },
]

generic_systems = [
  {
    name      = "Server14"
    hostname  = "Server14"
    link_tags = ["server14"]
    links = [
      {
        leaf_label                    = "Leaf1"
        target_switch_if_name         = "xe-0/0/1"
        target_switch_if_transform_id = 2
        group_label                   = "bond0"
        lag_mode                      = "lacp_active"
      },
      {
        leaf_label                    = "Leaf2"
        target_switch_if_name         = "xe-0/0/1"
        target_switch_if_transform_id = 2
        group_label                   = "bond0"
        lag_mode                      = "lacp_active"
      },
    ]
    vns = ["Vlan-100", "Vlan-200"]
  },
  {
    name      = "Server10"
    hostname  = "Server10"
    link_tags = ["server10"]
    links = [
      {
        leaf_label                    = "Leaf1"
        target_switch_if_name         = "xe-0/0/2"
        target_switch_if_transform_id = 2
        group_label                   = "bond0"
        lag_mode                      = "lacp_active"
      },
      {
        leaf_label                    = "Leaf2"
        target_switch_if_name         = "xe-0/0/2"
        target_switch_if_transform_id = 2
        group_label                   = "bond0"
        lag_mode                      = "lacp_active"
      },
    ]
    vns = ["Vlan-100", "Vlan-200"]
  },
  {
    name      = "FW"
    hostname  = "FW"
    link_tags = ["FW"]
    links = [
      {
        leaf_label                    = "Border1"
        target_switch_if_name         = "et-0/0/24"
        target_switch_if_transform_id = 1
        group_label                   = "bond0"
        lag_mode                      = "lacp_active"
      },
      {
        leaf_label                    = "Border2"
        target_switch_if_name         = "et-0/0/24"
        target_switch_if_transform_id = 1
        group_label                   = "bond0"
        lag_mode                      = "lacp_active"
      },
    ]
    vns = ["Vlan-10", "Vlan-20"]
  },
]
