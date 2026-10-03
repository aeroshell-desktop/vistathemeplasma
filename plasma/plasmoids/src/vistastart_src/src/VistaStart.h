/*
    SPDX-FileCopyrightText: 2021  <>
    SPDX-License-Identifier: LGPL-2.1-or-later
*/

#ifndef VISTASTART_H
#define VISTASTART_H

#include <QUrl>
#include <QQuickWindow>
#include <QVariant>
#include <QVariantList>

#include <Plasma/Applet>

class VistaStart : public Plasma::Applet
{
    Q_OBJECT

    Q_PROPERTY(QString defaultInternetEntry READ defaultInternetEntry NOTIFY defaultsChanged)
    Q_PROPERTY(QString defaultInternetName  READ defaultInternetName  NOTIFY defaultsChanged)

    Q_PROPERTY(QString defaultEmailEntry READ defaultEmailEntry NOTIFY defaultsChanged)
    Q_PROPERTY(QString defaultEmailName  READ defaultEmailName  NOTIFY defaultsChanged)

public:
    VistaStart(QObject *parentObject, const KPluginMetaData &data, const QVariantList &args);
    ~VistaStart();

    QString defaultInternetEntry();
    QString defaultInternetName();

    QString defaultEmailEntry();
    QString defaultEmailName();

    Q_INVOKABLE bool fileExists(QUrl path);

    Q_INVOKABLE void setOrb(QQuickWindow* w);

Q_SIGNALS:
    void defaultsChanged();

public Q_SLOTS:
    void onShowingDesktopChanged(bool enabled);

private:
    QQuickWindow *m_orbWindow;
};

#endif
