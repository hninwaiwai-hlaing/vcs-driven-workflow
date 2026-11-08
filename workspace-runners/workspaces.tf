# Read existing workspaces; this does not create or delete them.
data "tfe_workspace" "target" {
  for_each = var.workspace-names

  organization = var.organization
  name         = each.value
}