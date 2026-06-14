#!/bin/bash
server_info() {
echo "Device : $(hostname)"
echo "User   : $(whoami)"
echo "Date   : $(date)"
echo "IP     : $(hostname -I)"
}
check_service() {
if systemctl is-active --quiet $1 ; then
echo "[ OK ] $1 is running"
else "[ FAIL ] $1 is stopped"
fi
}
echo "Server System Check ..."
echo "=============================="
server_info
echo "=============================="
echo ""
echo "Checking Services ..."
echo "=============================="
SERVICES=("sshd" "firewalld" "crond")
for service in "${SERVICES[@]}";do
check_service "$service"
done
echo "=============================="
echo "Check Complete !"
