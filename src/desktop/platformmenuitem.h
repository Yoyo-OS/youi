/*** 
 * @Author: 柚子 40852301+uiYzzi@users.noreply.github.com
 * @Date: 2023-02-01 00:38:12
 * @LastEditors: 柚子 40852301+uiYzzi@users.noreply.github.com
 * @LastEditTime: 2023-02-01 00:38:20
 * @FilePath: /youi/src/desktop/platformmenuitem.h
 * @Description: 
 * @
 * @Copyright (c) 2023 by YoyoOS, All Rights Reserved. 
 */
#ifndef PLATFORMMENUITEM_H
#define PLATFORMMENUITEM_H

#include <QObject>

class PlatformMenuItem : public QObject
{
    Q_OBJECT
public:
    explicit PlatformMenuItem(QObject *parent = nullptr);

signals:

};

#endif // PLATFORMMENUITEM_H