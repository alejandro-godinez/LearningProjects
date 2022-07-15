package com.example.diceroller

import android.os.Bundle
import android.widget.Button
import android.widget.ImageView
import androidx.appcompat.app.AppCompatActivity

/**
 * This activity allows the user to roll a dice and view the result on the screen
 */
class MainActivity : AppCompatActivity() {

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.activity_main)

    val rollButton: Button = findViewById(R.id.button)
    rollButton.setOnClickListener() {
      rollDice(1)
      rollDice(2)
    }

    //Do a dice roll when the app starts
    rollDice(1)
    rollDice(2)
  }

  /**
   * Roll the dice and update the screen with the result
   * @param diceNum - the number of the dice to roll
   */
  private fun rollDice(diceNum: Int) {
    // Create new Dice object with 6 sides
    val dice = Dice(6)
    val diceRoll = dice.roll()

    // Find the image view in the layout
    val diceImage: ImageView = when (diceNum){
      1 -> findViewById(R.id.imageView)
      else -> findViewById(R.id.imageView2)
    }

    // determine which drawable resource ID to use based on the roll
    val drawableResource = when(diceRoll){
      1 -> R.drawable.dice_1
      2 -> R.drawable.dice_2
      3 -> R.drawable.dice_3
      4 -> R.drawable.dice_4
      5 -> R.drawable.dice_5
      else -> R.drawable.dice_6
    }

    // update the image view with the drawable id
    diceImage.setImageResource(drawableResource)

    //update the content description
    diceImage.contentDescription = diceRoll.toString()
  }


}

class Dice(private val numSides: Int) {
  fun roll(): Int {
    return (1..numSides).random()
  }
}