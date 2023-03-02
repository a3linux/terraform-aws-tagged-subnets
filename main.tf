locals {
  filter = var.name == null ? var.tags : merge({Name=var.name}, var.tags)
  subnet_ids = data.aws_subnet_ids.selected.ids
  cidr_blocks = [for s in data.aws_subnet.selected : s.cidr_block]
  azs = distinct([for s in data.aws_subnet.selected : s.availability_zone])
  az_cidr_blocks = {for a in local.azs : a => [for s in data.aws_subnet.selected : s.cidr_block if s.availability_zone == a]}
}

data "aws_subnet_ids" "selected" {
  vpc_id = var.vpc_id

  dynamic "filter" {
    for_each = local.filter

    content {
      name=format("tag:%s", filter.key)
      values=[filter.value]
    }
  }
}

data "aws_subnet" "selected" {
  for_each = data.aws_subnet_ids.selected.ids
  id = each.value
}
