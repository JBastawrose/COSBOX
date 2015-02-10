
var target = UIATarget.localTarget();

var a=2, b=2, c=2, d=2, e=2, f=2;
var one=0;


while (a > 0) {
    target.frontMostApp().navigationBar().rightButton().tap();
    target.frontMostApp().mainWindow().textFields()[0].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("f" + one);
    target.frontMostApp().mainWindow().textFields()[1].textFields()[0].tap();
    target.frontMostApp().windows()[1].pickers()[0].wheels()[0].selectValue("Foundation");
    target.frontMostApp().mainWindow().textFields()[2].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("f" + one);
    target.frontMostApp().mainWindow().textFields()[3].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("f" + one);
    // dismiss keyboard
    target.tap({x:325.50, y:336.00});
    target.frontMostApp().mainWindow().buttons()["Add Item"].tap();
    target.delay(1);
    a--;
    one++;
}
var one = 0;
while (b > 0) {
    target.frontMostApp().navigationBar().rightButton().tap();
    target.frontMostApp().mainWindow().textFields()[0].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("b" + one);
    target.frontMostApp().mainWindow().textFields()[1].textFields()[0].tap();
    target.frontMostApp().windows()[1].pickers()[0].wheels()[0].selectValue("Blush");
    target.frontMostApp().mainWindow().textFields()[2].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("b" + one);
    target.frontMostApp().mainWindow().textFields()[3].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("b" + one);
    // dismiss keyboard
    target.tap({x:325.50, y:336.00});
    target.frontMostApp().mainWindow().buttons()["Add Item"].tap();
    target.delay(1);
    b--;
    one++;
}
var one = 0;
while (c > 0) {
    target.frontMostApp().navigationBar().rightButton().tap();
    target.frontMostApp().mainWindow().textFields()[0].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("e" + one);
    target.frontMostApp().mainWindow().textFields()[1].textFields()[0].tap();
    target.frontMostApp().windows()[1].pickers()[0].wheels()[0].selectValue("Eyes");
    target.frontMostApp().mainWindow().textFields()[2].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("e" + one);
    target.frontMostApp().mainWindow().textFields()[3].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("e" + one);
    // dismiss keyboard
    target.tap({x:325.50, y:336.00});
    target.frontMostApp().mainWindow().buttons()["Add Item"].tap();
    target.delay(1);
    c--;
    one++;
}
var one = 0;
while (d > 0) {
    target.frontMostApp().navigationBar().rightButton().tap();
    target.frontMostApp().mainWindow().textFields()[0].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("l" + one);
    target.frontMostApp().mainWindow().textFields()[1].textFields()[0].tap();
    target.frontMostApp().windows()[1].pickers()[0].wheels()[0].selectValue("Lips");
    target.frontMostApp().mainWindow().textFields()[2].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("l" + one);
    target.frontMostApp().mainWindow().textFields()[3].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("l" + one);
    // dismiss keyboard
    target.tap({x:325.50, y:336.00});
    target.frontMostApp().mainWindow().buttons()["Add Item"].tap();
    target.delay(1);
    d--;
    one++;
}
var one = 0;
while (e > 0) {
    target.frontMostApp().navigationBar().rightButton().tap();
    target.frontMostApp().mainWindow().textFields()[0].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("n" + one);
    target.frontMostApp().mainWindow().textFields()[1].textFields()[0].tap();
    target.frontMostApp().windows()[1].pickers()[0].wheels()[0].selectValue("Nails");
    target.frontMostApp().mainWindow().textFields()[2].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("n" + one);
    target.frontMostApp().mainWindow().textFields()[3].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("n" + one);
    // dismiss keyboard
    target.tap({x:325.50, y:336.00});
    target.frontMostApp().mainWindow().buttons()["Add Item"].tap();
    target.delay(1);
    e--;
    one++;
}
var one = 0;
while (f > 0) {
    target.frontMostApp().navigationBar().rightButton().tap();
    target.frontMostApp().mainWindow().textFields()[0].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("o" + one);
    target.frontMostApp().mainWindow().textFields()[1].textFields()[0].tap();
    target.frontMostApp().windows()[1].pickers()[0].wheels()[0].selectValue("Others");
    target.frontMostApp().mainWindow().textFields()[2].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("o" + one);
    target.frontMostApp().mainWindow().textFields()[3].textFields()[0].tap();
    target.frontMostApp().keyboard().typeString("o" + one);
    // dismiss keyboard
    target.tap({x:325.50, y:336.00});
    target.frontMostApp().mainWindow().buttons()["Add Item"].tap();
    target.delay(1);
    f--;
    one++;
}

