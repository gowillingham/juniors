JO_TRYOUT_FORM_URL = 'https://docs.google.com/forms/d/12b4KX6Bw2EBplZhLTLOaEbQ-VHfR6cNwzlVtIBPnO8U/viewform'
JO_FALL_TRYOUT_FORM_URL = 'https://docs.google.com/forms/d/1gonQCWF1GqKlD2y3pCwaMS9KF4nnzf3aawjPpzOQnek/viewform'
JO_TRYOUT_ROSTERS_URL = 'https://docs.google.com/document/d/1xUaxYivxRCh11lpf6YgitCjPrnLzi6m3ECs-peBrKpM/edit#'
JO_FACT_SHEET_URL = 'https://docs.google.com/file/d/0B_zLWQdQueRZYVBUSVdlOW05UHc'
SKILL_SESSION_FORM_URL = 'https://docs.google.com/forms/d/17KPvtChUnK5wWsetNMn_3iekbEkTusbahndpyFBWZ6A/viewform'
JO_TOURNAMENT_REGISTRATION_FORM_URL = 'https://docs.google.com/document/d/1zUE0HGoVVwzicpp2dSrsSYLl4S1Xum5Eh-Zf0CQzfR8/edit'
BOOSTER_CAMP_REGISTRATION_URL = 'https://docs.google.com/forms/d/1C1G3n-pC0aPs8q7zqcx9MqnVao7IxUVRFyFtxt7ZqxY/viewform'

INHOUSE_LEAGUE_FIRST_SESSION_DATE = '2015-4-25'.to_date

INHOUSE_LEAGUE_PUBLIC_REGISTRATION_ENABLED = true

INHOUSE_LEAGUE_SESSION_GRID = [
  ["Sat, Apr 25", "8:30-10:00a", "10:30-12:00p", "Lakeville South HS", ""],
  ["Sat, May 2", "8:30-10:00a", "10:30-12:00p", "Lakeville South HS", "Picture Day!"],
  ["Sat, May 9", "8:30-10:00a", "10:30-12:00p", "Lakeville North HS", ""],
  ["Sat, May 16", "8:30-10:00a", "10:30-12:00p", "Lakeville South HS", ""],
  ["Sat, May 23", "8:30-10:00a", "10:30-12:00p", "Lakeville South HS", "Tournament!"],
]

APP_LONG_NAME = "Lakeville Junior Volleyball"
APP_SHORT_NAME = "Lakeville Juniors"
APP_HOST_NAME = "lakevillejuniors.com"

INFO_EMAIL_ADDRESS = "info@lakevillejuniors.com"
ADMIN_EMAIL_ADDRESS = "willingham@lakevillejuniors.com"
OWNER_EMAIL_ADDRESS = "gowillingham@gmail.com"
JO_CLUB_DIRECTOR_EMAIL_ADDRESS = 'denjohnson12@gmail.com'
REPORT_TO_EMAIL_LIST = ['willingham@lakevillejuniors.com', 'info@lakevillejuniors.com']

PAYPAL_COMPLETED = 'Completed'
PAYPAL_PENDING = 'Pending'
PAYPAL_FAILED = 'Failed'

APP_ADDRESS = {
  :street => '21266 Inspiration Path',
  :city_state_zip => 'Lakeville, MN 55044'
}
APP_PHONE = '(952) 431-6341'

LITE_VOLLEYBALL_PRICE_IN_CENTS = 3500

SCHOOL_OPTIONS = [
  ['All Saints', 'ASE'], 
  ['Cherryview', 'CVE'], 
  ['Christina Huddleston', 'CHE'], 
  ['Eastview', 'EVE'], 
  ['John F Kennedy', 'JFK'], 
  ['Lake Marion', 'LME'], 
  ['Lakeview', 'LVE'], 
  ['Oak Hills', 'OHE'], 
  ['Orchard Lake', 'OLE'], 
  ["My school's not listed ..", 'NA']
]

SIZE_OPTIONS = [
  ['YS - Youth small', 'YS'], 
  ['YM - Youth medium', 'YM'], 
  ['YL - Youth large', 'YL'], 
  ['S - Adult small', 'S'], 
  ['M - Adult medium', 'M'], 
  ['L - Adult large', 'L'], 
  ['XL - Adult X-large', 'XL'], 
  ['XXL - Adult XX-large', 'XXL']
]

SESSION_OPTIONS = [
  ['Session I Beginner (grade 1-3)', 1], 
  ['Session II Intermediate (grade 3-5)', 2]
]

GRADE_OPTIONS = (1..6).map { |i| [i,i] }  


