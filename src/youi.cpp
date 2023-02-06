/*** 
 * @Author: 柚子 40852301+uiYzzi@users.noreply.github.com
 * @Date: 2023-01-31 20:58:05
 * @LastEditors: 柚子 40852301+uiYzzi@users.noreply.github.com
 * @LastEditTime: 2023-02-01 17:13:50
 * @FilePath: /youi/src/youi.cpp
 * @Description: 
 * @
 * @Copyright (c) 2023 by YoyoOS, All Rights Reserved. 
 */

#include "youi.h"
#include "thememanager.h"
#include "iconthemeprovider.h"
#include "shadowhelper/windowshadow.h"
#include "blurhelper/windowblur.h"
#include "windowhelper.h"
#include "newiconitem.h"
#include "wheelhandler.h"
#include "qqmlsortfilterproxymodel.h"

#include "desktop/menupopupwindow.h"

#include <QDebug>
#include <QQmlEngine>
#include <QQuickStyle>
#include <QFontDatabase>

//下面的函数有两个作用，一是避免了qml文件url的重复输入，二是当存在两个uri参数时可自动重复注册
//例如，uri1的值为"Youi",uri2的值为"Youi.Units"。那么只需要该模块的程序只用导入"Youi.Units"，而需要整个"Youi"的程序则可以导入"Youi"

//单例类型
template <typename T>
inline void youiRegisterSingletonType(const char *uri1, const char *uri2, int versionMajor, int versionMinor, const char *qmlName,
                                     QObject *(*callback)(QQmlEngine *, QJSEngine *)) {
    qmlRegisterSingletonType<T>(uri1, versionMajor, versionMinor, qmlName, callback);
    if (uri2)
        qmlRegisterSingletonType<T>(uri2, versionMajor, versionMinor, qmlName, callback);
}

inline void youiRegisterSingletonType(const char *uri1, const char *uri2, int versionMajor, int versionMinor, const char *qmlName, const char *subdir = "") {
    static QString urlTemplate = QStringLiteral("qrc:/youi/kit/qml/%1%2.qml");
    const QUrl url(urlTemplate.arg(subdir).arg(qmlName));
    qmlRegisterSingletonType(url, uri1, versionMajor, versionMinor, qmlName);
    if (uri2)
        qmlRegisterSingletonType(url, uri2, versionMajor, versionMinor, qmlName);
}


//注册QObject 类型
template<typename T>
inline void youiRegisterType(const char *uri1, const char *uri2, int versionMajor, int versionMinor, const char *qmlName) {
    qmlRegisterType<T>(uri1, versionMajor, versionMinor, qmlName);
    if (uri2)
        qmlRegisterType<T>(uri2, versionMajor, versionMinor, qmlName);
}

inline void youiRegisterType(const char *uri1, const char *uri2, int versionMajor, int versionMinor, const char *qmlName, const char *subdir = "") {
    static QString urlTemplate = QStringLiteral("qrc:/youi/kit/qml/%1%2.qml");
    const QUrl url(urlTemplate.arg(subdir).arg(qmlName));
    qmlRegisterType(url, uri1, versionMajor, versionMinor, qmlName);
    if (uri2)
        qmlRegisterType(url, uri2, versionMajor, versionMinor, qmlName);
}

inline void youiRegisterTypeAlias(const char *uri1, const char *uri2, int versionMajor, int versionMinor, const char *qmlName, const char *alias, const char *subdir = "") {
    static QString urlTemplate = QStringLiteral("qrc:/youi/kit/qml/%1%2.qml");
    const QUrl url(urlTemplate.arg(subdir).arg(qmlName));
    qmlRegisterType(url, uri1, versionMajor, versionMinor, alias);
    if (uri2)
        qmlRegisterType(url, uri2, versionMajor, versionMinor, alias);
}

void Youi::initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_ASSERT(QLatin1String(uri) == QLatin1String("Youi"));

    // Import FluentSystemIcons
    int fontId = QFontDatabase::addApplicationFont(":/youi/kit/resources/fonts/fonticons/FluentSystemIcons-Regular.ttf");
    QFontDatabase::applicationFontFamilies(fontId);

    // Set base URL to the plugin URL
    engine->setBaseUrl(baseUrl());

    // For system icons
    engine->addImageProvider(QStringLiteral("icontheme"), new IconThemeProvider());
}

void Youi::registerTypes(const char *uri)
{
    // @uri Youi
    qmlRegisterModule(uri, 1, 0);

    // @uri Youi.Core
    const QByteArray coreUri = QByteArray(uri).append(".Core");
    qmlRegisterModule(coreUri.constData(), 1, 0);

    // @uri Youi.Theme
    const QByteArray themeUri = QByteArray(uri).append(".Theme");
    qmlRegisterModule(themeUri.constData(), 1, 0);

    // @uri Youi.Controls
    const QByteArray controlsUri = QByteArray(uri).append(".Controls");
    qmlRegisterModule(controlsUri.constData(), 1, 0);

    youiRegisterSingletonType<ThemeManager>(uri, coreUri, 1, 0, "ThemeManager", [](QQmlEngine *engine, QJSEngine *scriptEngine) -> QObject * {
        Q_UNUSED(engine)
        Q_UNUSED(scriptEngine)
        return new ThemeManager;
    });

    youiRegisterType<WindowShadow>(uri, coreUri, 1, 0, "WindowShadow");
    youiRegisterType<WindowBlur>(uri, coreUri, 1, 0, "WindowBlur");
    youiRegisterType<WindowHelper>(uri, coreUri, 1, 0, "WindowHelper");
    youiRegisterType<NewIconItem>(uri, coreUri, 1, 0, "IconItem");
    youiRegisterType<MenuPopupWindow>(uri, coreUri, 1, 0, "MenuPopupWindow");
    youiRegisterType<WheelHandler>(uri, coreUri, 1, 0, "WheelHandler");
    youiRegisterType<QQmlSortFilterProxyModel>(uri, coreUri, 1, 0, "SortFilterProxyModel");

    youiRegisterSingletonType(uri, themeUri, 1, 0, "Theme","controls/");
    youiRegisterSingletonType(uri, themeUri, 1, 0, "Units","controls/");

    youiRegisterType(uri, controlsUri, 1, 0, "AboutDialog","controls/");
    youiRegisterType(uri, controlsUri, 1, 0, "ActionTextField","controls/");
    youiRegisterType(uri, controlsUri, 1, 0, "AppWindow","controls/");
    youiRegisterType(uri, controlsUri, 1, 0, "BusyIndicator","controls/");
    youiRegisterType(uri, controlsUri, 1, 0, "PopupTips","controls/");
    youiRegisterType(uri, controlsUri, 1, 0, "RoundedRect","controls/");
    youiRegisterType(uri, controlsUri, 1, 0, "TabBar","controls/");
    youiRegisterType(uri, controlsUri, 1, 0, "TabButton","controls/");
    youiRegisterType(uri, controlsUri, 1, 0, "TabCloseButton","controls/");
    youiRegisterType(uri, controlsUri, 1, 0, "TabView","controls/");
    youiRegisterType(uri, controlsUri, 1, 0, "Toast","controls/");
    youiRegisterType(uri, controlsUri, 1, 0, "Window","controls/");
    youiRegisterType(uri, controlsUri, 1, 0, "DesktopMenu","controls/");
    youiRegisterType(uri, controlsUri, 1, 0, "TextButton","controls/");
    qmlProtectModule(uri, 1);
}
