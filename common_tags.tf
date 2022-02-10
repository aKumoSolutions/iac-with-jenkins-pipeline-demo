locals {
  common_tags = {
      Environment   = var.env_tag
      ProjectName   = var.project_tag
      ManagedBy     = var.managed_tag
      Owner         = var.owner_tag
      Team          = var.team_tag
      GitUrl        = var.giturl_tag
      BackupName    = var.backupname_tag
  }
}