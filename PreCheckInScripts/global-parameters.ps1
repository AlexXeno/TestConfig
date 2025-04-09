###################################################
#
# Global parameters for check-in utility scripts
#
# Should be kept in sync with the github repository
# in use
#
###################################################
# Tokens to replace environmental values with
$global:TSServerToken="xTSSERVERx"
$global:SQLInstanceToken="xSQLINSTANCEx"
$global:SQLUserToken="xSQLUSERx"
# Environmental values, use arrays to replace
# any values that may creep in like IP addresses
$global:TSServers=$("MZTSBATCH01", "172.33.1.12", "HEMCCAPPT002", "172.33.10.202", "HEMCCSQLI-CL", "172.33.20.202", "HEMCCSQLP-CL1")
$global:SQLInstances=$("HEMCCAPPT002", "HEMCCSQLI-CL\TSDB", "HEMCCSQLP-CL1\TSDB")
$global:SQLUsers=$("HELABA\mcc_svc_app_t", "HELABA\mcc_svc_app_i", "HELABA\mcc_svc_app_p")
