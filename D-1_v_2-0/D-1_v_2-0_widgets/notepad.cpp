#include <QFileDialog>
#include <QFile>
#include <QMessageBox>
#include <QTextStream>
#include <QMenuBar>

#include<stdio.h>
#include "notepad.h"
#include "ui_notepad.h"

Notepad::Notepad(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::Notepad)
{
    ui->setupUi(this);

}

Notepad::~Notepad()
{
    delete ui;
}

void Notepad::on_quitButton_clicked()
{

    FILE *fp;
    char msg[] = "yes\n";
//    char *msg = "yes\n";

    fp = fopen("abc.txt", "w");

//    fwrite(total_content, 1, sizeof(total_content), fp);
    fwrite(msg, 1, sizeof(msg) - 1, fp);

    fclose(fp);

    qApp->quit();
}

void Notepad::on_actionOpen_triggered()
{
    QString fileName = QFileDialog::getOpenFileName(this, tr("Open File"), QString(),
            tr("Text Files (*.txt);;C++ Files (*.cpp *.h)"));

    if (!fileName.isEmpty()) {
        QFile file(fileName);
        if (!file.open(QIODevice::ReadOnly)) {
            QMessageBox::critical(this, tr("Error"), tr("Could not open file"));
            return;
        }
        QTextStream in(&file);
        ui->textEdit->setText(in.readAll());
        file.close();
    }
}
