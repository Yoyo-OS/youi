/*** 
 * @Author: 柚子 40852301+uiYzzi@users.noreply.github.com
 * @Date: 2023-01-31 20:58:00
 * @LastEditors: 柚子 40852301+uiYzzi@users.noreply.github.com
 * @LastEditTime: 2023-02-01 12:39:03
 * @FilePath: /youi/src/youi.h
 * @Description: 
 * @
 * @Copyright (c) 2023 by YoyoOS, All Rights Reserved. 
 */

#ifndef YOUI_H
#define YOUI_H

#include <QtQml/QQmlExtensionPlugin>

class Youi : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void initializeEngine(QQmlEngine *engine, const char *uri);
    void registerTypes(const char *uri);

private:
    QString resolveFilePath(const QString &path) const
    {
        return baseUrl().toLocalFile() + QLatin1Char('/') + path;
    }

};

#endif // YOUI_H
