import Glibc
import SwiftyGPIO

let gpios = SwiftyGPIO.GPIOs(for: .RaspberryPi2)
var greenLed = gpios[.P17]!
var redLed = gpios[.P27]!
var blueLed = gpios[.P22]!

greenLed.direction = .OUT
redLed.direction = .OUT
blueLed.direction = .OUT

func ledSetColor(_ redValue: Int, _ greenValue: Int, _ blueValue: Int) {
  redLed.value = redValue
  greenLed.value = greenValue
  blueLed.value = blueValue
}

func ledInit() {
  ledSetColor(0, 0, 0)
}

ledInit()

repeat {
  ledSetColor(1, 0, 1)
  sleep(1)
  ledSetColor(0, 1, 0)
  sleep(1)
  ledSetColor(0, 0, 1)
  sleep(1)
  ledSetColor(1, 1, 0)
  sleep(1)
  ledSetColor(1, 0, 1)
  sleep(1)
  ledSetColor(0, 1, 1)
  sleep(1)
  ledInit()
  sleep(5)
} while(true)
