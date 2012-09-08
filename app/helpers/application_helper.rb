module ApplicationHelper
	def fix_gender(base_word, word_to_fix)
		gender_letter = base_word.end_with?("o") ? "o" : "a"
		if gender_letter == "o"
			return word_to_fix
		else
			return word_to_fix[-1] == "o" ? word_to_fix.chop.concat(gender_letter) : word_to_fix.concat(gender_letter)
		end
	end
end
