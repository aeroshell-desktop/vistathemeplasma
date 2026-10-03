/*
    SPDX-FileCopyrightText: 2021  <>
    SPDX-License-Identifier: LGPL-2.1-or-later
*/

#include "VistaStart.h"

#include <QFileInfo>

#include <KApplicationTrader>
#include <KService>
#include <KSycoca>
#include <KWindowSystem>

#include <PlasmaQuick/PlasmaShellWaylandIntegration>

VistaStart::VistaStart(QObject *parentObject, const KPluginMetaData &data, const QVariantList &args)
    : Plasma::Applet(parentObject, data, args)
    , m_orbWindow(nullptr)
{
    connect(KWindowSystem::self(), SIGNAL(showingDesktopChanged(bool)), this, SLOT(onShowingDesktopChanged(bool)));
    // FIXME: doesn't work
    connect(KSycoca::self(), &KSycoca::databaseChanged, this, &VistaStart::defaultsChanged);
}

VistaStart::~VistaStart()
{
}


QString VistaStart::defaultInternetEntry()
{
    KService::Ptr defaultApp = KApplicationTrader::preferredService("x-scheme-handler/http");

    if (defaultApp) {
        return QString("applications:%1.desktop").arg(defaultApp.get()->desktopEntryName());
    } else {
        return "";
    }
}

QString VistaStart::defaultInternetName()
{
    KService::Ptr defaultApp = KApplicationTrader::preferredService("x-scheme-handler/http");

    if (defaultApp) {
        return defaultApp.get()->name();
    } else {
        return "";
    }
}


QString VistaStart::defaultEmailEntry()
{
    KService::Ptr defaultApp = KApplicationTrader::preferredService("x-scheme-handler/mailto");

    if (defaultApp) {
        return QString("applications:%1.desktop").arg(defaultApp.get()->desktopEntryName());
    } else {
        return "";
    }
}

QString VistaStart::defaultEmailName()
{
    KService::Ptr defaultApp = KApplicationTrader::preferredService("x-scheme-handler/mailto");

    if (defaultApp) {
        return defaultApp.get()->name();
    } else {
        return "";
    }
}


bool VistaStart::fileExists(QUrl path)
{
    if (!path.isLocalFile()) {
        return false;
    }

    QFileInfo file(path.toLocalFile());
    return file.exists() && file.isFile();
}

void VistaStart::setOrb(QQuickWindow* w)
{
    PlasmaShellWaylandIntegration::get(w)->setPosition(w->position());
    m_orbWindow = w;
}

void VistaStart::onShowingDesktopChanged(bool enabled)
{
    if (enabled && m_orbWindow) {
        m_orbWindow->raise();
    }
}

K_PLUGIN_CLASS(VistaStart)

#include "VistaStart.moc"
