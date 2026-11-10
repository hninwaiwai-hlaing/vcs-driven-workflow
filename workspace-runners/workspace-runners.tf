# 1. Frontend Network
resource "tfe_workspace_run" "fe-network" {
  workspace_id = data.tfe_workspace.target["fe-network"].id

  apply {
    manual_confirm = false
    wait_for_run   = true
    message        = "Initial apply: fe-network-ws"
  }

  # destroy {
  #   manual_confirm = false
  #   wait_for_run   = true
  #   message        = "Destroy: Frontend Network"
  # }
}

# 2. Frontend Security
resource "tfe_workspace_run" "fe-security" {
  workspace_id = data.tfe_workspace.target["fe-security"].id
  depends_on = [tfe_workspace_run.fe-network]

  apply {
    manual_confirm = false
    wait_for_run   = true
    message        = "Initial apply: Frontend Security WS"
  }

  # destroy {
  #   manual_confirm = false
  #   wait_for_run   = true
  #   message        = "Destroy: Frontend Security"
  # }
}

# 3. Frontend Compute
resource "tfe_workspace_run" "fe-compute" {
  workspace_id = data.tfe_workspace.target["fe-compute"].id

  depends_on = [tfe_workspace_run.fe-security]

  apply {
    manual_confirm = false
    wait_for_run   = true
    message        = "Initial apply: Frontend Compute WS"
  }

  # destroy {
  #   manual_confirm = false
  #   wait_for_run   = true
  #   message        = "Destroy: Frontend Compute"
  # }
}

# 4. Backend Network
resource "tfe_workspace_run" "be-network" {
  workspace_id = data.tfe_workspace.target["be-network"].id

  depends_on = [tfe_workspace_run.fe-compute]

  apply {
    manual_confirm = false
    wait_for_run   = true
    message        = "Initial apply: Backend Network"
  }

  # destroy {
  #   manual_confirm = false
  #   wait_for_run   = true
  #   message        = "Destroy: Backend Network"
  # }
}

# 5. Backend Security
resource "tfe_workspace_run" "be-security" {
  workspace_id = data.tfe_workspace.target["be-security"].id

  depends_on = [tfe_workspace_run.be-network]

  apply {
    manual_confirm = false
    wait_for_run   = true
    message        = "Initial apply: Backend Security"
  }

  # destroy {
  #   manual_confirm = false
  #   wait_for_run   = true
  #   message        = "Destroy: Backend Security"
  # }
}

# 6. Backend Compute
resource "tfe_workspace_run" "be-compute" {
  workspace_id = data.tfe_workspace.target["be-compute"].id

  depends_on = [tfe_workspace_run.be-security]

  apply {
    manual_confirm = false
    wait_for_run   = true
    message        = "Initial apply: Backend Compute"
  }

  # destroy {
  #   manual_confirm = false
  #   wait_for_run   = true
  #   message        = "Destroy: Backend Compute"
  # }
}

# 7. VPC Peering
resource "tfe_workspace_run" "vpc-peering" {
  workspace_id = data.tfe_workspace.target["peering"].id

  depends_on = [tfe_workspace_run.be-compute]

  apply {
    manual_confirm = false
    wait_for_run   = true
    message        = "Initial apply: VPC Peering"
  }

  # destroy {
  #   manual_confirm = false
  #   wait_for_run   = true
  #   message        = "Destroy: VPC Peering"
  # }
}