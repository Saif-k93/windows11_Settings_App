import QtQuick
import QtQml.Models

ListModel {
    ListElement {title: "Wi-Fi"; _text: "Connect, manage known networks, metered network"; icon: "qrc:/img/network/Wifi.png"}
    ListElement {title: "Ethernet"; _text: "Authentication, IP and DNS settings, metered network"; icon: "qrc:/img/network/EthernetCabel.png"}
    ListElement {title: "VPN"; _text: "Add, connect, manage"; icon: "qrc:/img/network/Vpn.png"}
    ListElement {title: "Mobile hotspot"; _text: "Share your internet connection"; icon: "qrc:/img/network/MobileHotspot.png"}
    ListElement {title: "Airplan mode"; _text: "Stop wireless communication"; icon: "qrc:/img/network/AirplanMode.png"}
    ListElement {title: "Proxy"; _text: "Proxy server for Wi-Fi and Ethernet connections"; icon: "qrc:/img/network/Proxy.png"}
    ListElement {title: "Dial-Up"; _text: "Set up a dial-up internet connection"; icon: "qrc:/img/network/Dialup.png"}
    ListElement {title: "Advanced network settings"; _text: "View all network adapters, network reset"; icon: "qrc:/img/network/AdvancedNetwork.png"}
}
