# output "instances_id_first" {
#     value = aws_instance.my-server1.id
#     type = string
# }

# output "instances_id_second" {
#     value = aws_instance.my-server2.id
#     type = string
# }

output "instance1_id" {
    value = aws_instance.my-server1.id
}

output "instance2_id" {
    value = aws_instance.my-server2.id
}