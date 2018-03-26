-- Title: NumericTextFields
-- Name: Chelsea NF
-- Course: ICS2O/3C
-- This program displays a math question and asks the user to answer in a numeric 
-- textfield terminal.

---------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- variable for the timer
local totalSeconds = 5
local secondsLeft = 5
local clockText
local countDownTimer

local lives = 3
local heart1
local heart2

--*** ADD LOCAL VARIABLE FOR: INCORRECT OBJECT, POINTS OBJECT, POINTS


----------------------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------------------


local function UpdateTime()

	-- decrement the number of seeconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left on the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1

		--*** IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUND, SHOW A YOU LOSE IMAGE
		-- AND CANCEL THE TIMER REMOVE THE THIRD HEART BY MAKING IT INVISBLE
		if (lives == 2) then
			heart2.isVisible = false
		elseif (lives == 1) then
				heart1.isVisible = false
		end

		--*** CALL THE FUNCTION TO ASK A NEW QUESTION
	end
end

-- function that calls the timer
local function StarterTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

--------------------------------------------------------------------------------
--OBJECT CREATION
---------------------------------------------------------------------------------

-- create the lives to display on the screen
heart1 = display.newImageRect("Image/heart.png", 100, 100)
