variable "organization" {
  description = "HCP Terraform organization containing the target workspaces."
  type        = string
  default     = "vcs-wf-org"
}

variable "workspace-names" {
  description = "Actual HCP workspace names, which may differ from local directory names."
  type = object({
    fe-network  = string
    fe-security = string
    fe-compute  = string
    be-network  = string
    be-security = string
    be-compute  = string
    peering     = string
  })

  default = {
    fe-network  = "fe-network-ws"
    fe-security = "fe-security-ws"
    fe-compute  = "fe-compute-ws"
    be-network  = "be-network-ws"
    be-security = "be-security-ws"
    be-compute  = "be-compute-ws"
    peering     = "peering-ws"
  }
}