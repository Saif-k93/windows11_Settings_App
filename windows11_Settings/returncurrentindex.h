#ifndef RETURNCURRENTINDEX_H
#define RETURNCURRENTINDEX_H

#include <QString>
#include <QDebug>
#include <QVariant>
#include <QObject>

class ReturnCurrentIndex : public QObject
{
    Q_OBJECT

public:
    explicit ReturnCurrentIndex(QObject *parent = nullptr);

    Q_INVOKABLE QVariant getIndex( QVariant );

signals:

};

#endif // RETURNCURRENTINDEX_H
