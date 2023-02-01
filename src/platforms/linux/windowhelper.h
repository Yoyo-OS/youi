#ifndef WINDOWHELPER_H
#define WINDOWHELPER_H

#include <QObject>
#include <QWindow>
#include <xcb/xcb.h>

class WindowHelper : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool compositing READ compositing NOTIFY compositingChanged)

public:
    explicit WindowHelper(QObject *parent = nullptr);

    bool compositing() const;

    Q_INVOKABLE void startSystemMove(QWindow *w);
    Q_INVOKABLE void startSystemResize(QWindow *w, Qt::Edges edges);

    Q_INVOKABLE void minimizeWindow(QWindow *w);

signals:
    void compositingChanged();

private:
    void doStartSystemMoveResize(QWindow *w, int edges);
    void onCompositingChanged(bool enabled);

private:
    xcb_atom_t m_moveResizeAtom;
    bool m_compositing;
};

#endif // WINDOWHELPER_H