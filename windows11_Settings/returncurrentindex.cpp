#include "returncurrentindex.h"

ReturnCurrentIndex::ReturnCurrentIndex(QObject *parent)
    : QObject{parent}
{

}

QVariant ReturnCurrentIndex::getIndex(QVariant _Index)
{
    bool ok;
    int index = _Index.toInt(&ok);
    if(ok){
        switch (index) {
        case 0: return "System";
        case 1: return "Bluetooth & devices";
        case 2: return "Network & internet";
        case 3: return "Personalization";
        case 4: return "Apps";
        case 5: return "Accounts";
        case 6: return "Time & language";
        case 7: return "Gaming";
        case 8: return "Accessibility";
        case 9: return "Privacy & security";
        case 10: return"Windows Update";
        default: return "";

        }
    }
    else
        return "";
}
