/*
 *  SPDX-FileCopyrightText: 2026 catpswin56 <catpswin5@proton.me>
 *
 *  SPDX-License-Identifier: AGPL-3.0-or-later
 */

#include "positionmanagerplugin.h"

#include "positionmanager.h"

#include <QQmlEngine>

void PositionManagerPlugin::registerTypes(const char *uri)
{
    qmlRegisterType<PositionManager>(uri, 1, 0, "PositionManager");
}

#include "moc_positionmanagerplugin.cpp"
