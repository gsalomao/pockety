#include <QApplication>
#include <QPushButton>
#include <QDebug>

int main(int argc, char** argv) {
    QApplication app(argc, argv);

    qDebug() << "Hello world!";

    QPushButton hello("Hello world!", 0);
    hello.resize(300, 100);

    hello.show();

    return app.exec();
}
