/*
    SPDX-FileCopyrightText: 2021  <>
    SPDX-License-Identifier: LGPL-2.1-or-later
*/

#ifndef VOLUME_H
#define VOLUME_H

#include <QGuiApplication>
#include <Plasma/Applet>
#include <QVariant>
#include <QWindow>
#include <KSharedConfig>

class Volume : public Plasma::Applet
{
    Q_OBJECT

public:
    Volume(QObject *parentObject, const KPluginMetaData &data, const QVariantList &args);
    ~Volume();

    Q_INVOKABLE void setPopupPosition(QWindow* w, int x, int y) const;

    Q_INVOKABLE QString getDecorationPluginName() const;
    Q_INVOKABLE QString getDecorationThemeName() const;

private:
    KSharedConfig::Ptr m_config;
};

#endif // VOLUME_H
