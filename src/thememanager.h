#ifndef THEMEMANAGER_H
#define THEMEMANAGER_H

#include <QObject>
#include <QFont>
#include <QColor>

#define ACCENTCOLOR_BLUE   0
#define ACCENTCOLOR_RED    1
#define ACCENTCOLOR_GREEN  2
#define ACCENTCOLOR_PURPLE 3
#define ACCENTCOLOR_PINK   4
#define ACCENTCOLOR_ORANGE 5
#define ACCENTCOLOR_GREY   6

class ThemeManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool darkMode READ darkMode NOTIFY darkModeChanged)
    Q_PROPERTY(QColor accentColor READ accentColor NOTIFY accentColorChanged)
    Q_PROPERTY(QColor color0 READ color0 NOTIFY colorChanged)
    Q_PROPERTY(QColor color1 READ color1 NOTIFY colorChanged)
    Q_PROPERTY(QColor color2 READ color2 NOTIFY colorChanged)
    Q_PROPERTY(QColor color3 READ color3 NOTIFY colorChanged)
    Q_PROPERTY(QColor color4 READ color4 NOTIFY colorChanged)
    Q_PROPERTY(QColor color5 READ color5 NOTIFY colorChanged)
    Q_PROPERTY(QColor color6 READ color6 NOTIFY colorChanged)
    Q_PROPERTY(qreal devicePixelRatio READ devicePixelRatio CONSTANT)
    Q_PROPERTY(qreal fontSize READ fontSize NOTIFY fontSizeChanged)
    Q_PROPERTY(QString fontFamily READ fontFamily NOTIFY fontFamilyChanged)

public:
    explicit ThemeManager(QObject *parent = nullptr);

    qreal devicePixelRatio() const;

    bool darkMode() { return m_darkMode; }
    QColor accentColor() { return m_accentColor; }

    qreal fontSize() { return m_fontSize; }
    QString fontFamily() { return m_fontFamily; }

    QColor color0() { return m_blueColor; }
    QColor color1() { return m_redColor; }
    QColor color2() { return m_greenColor; }
    QColor color3() { return m_purpleColor; }
    QColor color4() { return m_pinkColor; }
    QColor color5() { return m_orangeColor; }
    QColor color6() { return m_greyColor; }

signals:
    void darkModeChanged();
    void accentColorChanged();
    void fontSizeChanged();
    void fontFamilyChanged();
    void colorChanged();
private slots:
    void initData();
    void initDBusSignals();
    void onDBusDarkModeChanged(bool darkMode);
    void onDBusColorChanged();
    void onDBusAccentColorChanged(int accentColorID);
    void onDBusFontSizeChanged();
    void onDBusFontFamilyChanged();

private:
    void setAccentColor(int accentColorID);

private:
    bool m_darkMode;
    int m_accentColorIndex;

    QColor m_blueColor   = QColor(51,  133, 255);   // #3385FF
    QColor m_redColor    = QColor(255, 92,  109);   // #FF5C6D
    QColor m_greenColor  = QColor(53,  191, 86);    // #35BF56
    QColor m_purpleColor = QColor(130, 102, 255);   // #8266FF
    QColor m_pinkColor   = QColor(202, 100, 172);   // #CA64AC
    QColor m_orangeColor = QColor(254, 160, 66);    // #FEA042
    QColor m_greyColor   = QColor(79, 89, 107);     // #4F596B

    QColor m_accentColor;
    qreal m_fontSize;
    QString m_fontFamily;
};

#endif // THEMEMANAGER_H
