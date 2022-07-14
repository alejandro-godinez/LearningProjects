package com.example.diceroller

import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

/**
 * This activity allows the user to roll a dice and view the result on the screen
 */
class MainActivity : AppCompatActivity() {

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.activity_main)

    val rollButton: Button = findViewById(R.id.button)
    rollButton.setOnClickListener() { rollDice() }
  }

  /**
   * Roll the dice and update the screen with the result
   */
  private fun rollDice() {
    // Create new Dice object with 6 sides
    val dice = Dice(6)

    // Update the screen with two dice rolls
    val resultForDice1: TextView = findViewById(R.id.textView)
    resultForDice1.text = "D1: " + dice.roll().toString()
    val resultForDice2: TextView = findViewById(R.id.textView2)
    resultForDice2.text = "D2: " + dice.roll().toString()
  }


}

class Dice(private val numSides: Int) {
  fun roll(): Int {
    return (1..numSides).random()
  }
}