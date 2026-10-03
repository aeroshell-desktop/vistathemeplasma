/*
    SPDX-FileCopyrightText: 2021  <>
    SPDX-License-Identifier: LGPL-2.1-or-later
*/

#include "volume.h"

#include <PlasmaQuick/PlasmaShellWaylandIntegration>

Volume::Volume(QObject *parentObject, const KPluginMetaData &data, const QVariantList &args)
    : Plasma::Applet(parentObject, data, args)
{
    m_config = KSharedConfig::openConfig("kwinrc", KConfig::NoGlobals);
}

Volume::~Volume()
{
}

void Volume::setPopupPosition(QWindow* w, int x, int y) const
{
    PlasmaShellWaylandIntegration::get(w)->setPosition(QPoint(x, y));
}

QString Volume::getDecorationPluginName() const
{
    return m_config->group(QStringLiteral("org.kde.kdecoration2")).readEntry(QStringLiteral("library"), QStringLiteral("org.smod.smod"));
}
QString Volume::getDecorationThemeName() const
{
    return m_config->group(QStringLiteral("org.kde.kdecoration2")).readEntry(QStringLiteral("theme"), QStringLiteral("SMOD"));
}

K_PLUGIN_CLASS(Volume)

#include "volume.moc"
