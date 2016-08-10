# utils
window.ClassName = require 'utils/ClassName'

format_date = require 'utils/format_date'
Date.prototype.format = (str)->
  format_date(this, str)

# layouts
window.YieldComponent = require 'react/layouts/YieldComponent'
# window.AsideCollapseLayout = require 'react/layouts/AsideCollapseLayout'
# window.SimulateMobileLayout = require 'react/layouts/SimulateMobileLayout'
window.YouthLiveLayout = require 'react/layouts/YouthLiveLayout'

# # components
# window.SlideShow = require 'react/slides/SlideShow'

# # demo
# # mobile learning center
# window.MobileLearningCenterLayout = require 'react/mobile/learning-center/layouts/MobileLearningCenterLayout'
# window.MobileLearningCenterSecondaryLayout = require 'react/mobile/learning-center/layouts/MobileLearningCenterSecondaryLayout'
# window.MobileLearningCenterChatLayout = require 'react/mobile/learning-center/layouts/MobileLearningCenterChatLayout'

# window.MobileLearningCenter       = require 'react/mobile/learning-center/MobileLearningCenter'
# window.MobileLearningProgress     = require 'react/mobile/learning-center/MobileLearningProgress'

# window.Search                         = require 'react/mobile/learning-center/subjects/Search'
# window.SubjectsTree                   = require 'react/mobile/learning-center/subjects/SubjectsTree'
# window.MobileLearningSubjects         = require 'react/mobile/learning-center/subjects/MobileLearningSubjects'
# window.MobileLearningSubjectsOutline  = require 'react/mobile/learning-center/subjects/MobileLearningSubjectsOutline'
# window.MobileLearningSubjectsPosts    = require 'react/mobile/learning-center/subjects/MobileLearningSubjectsPosts'
# window.MobileLearningSubjectsPostsAll = require 'react/mobile/learning-center/subjects/MobileLearningSubjectsPostsAll'
# window.MobileLearningSubjectsTarget   = require 'react/mobile/learning-center/subjects/MobileLearningSubjectsTarget'

# window.MobileLearningMessages         = require 'react/mobile/learning-center/messages/MobileLearningMessages'
# window.MobileLearningMessagesChannel  = require 'react/mobile/learning-center/messages/MobileLearningMessagesChannel'

# window.MobileLearningPlan = require 'react/mobile/learning-center/plan/MobileLearningPlan'
# window.MobileLearningPlanId = require 'react/mobile/learning-center/plan/MobileLearningPlanId'

# window.MobileLearningSubjectsTargetSolve = require 'react/mobile/learning-center/MobileLearningSubjectsTargetSolve'

# window.MobileLearningTodo = require 'react/mobile/learning-center/MobileLearningTodo'

# window.ChatBox = require 'react/mobile/learning-center/chatbox/ChatBox'

# youth live
window.YouthLiveIndexPage = require 'react/youth/live/YouthLiveIndexPage'
window.YouthLiveNew = require 'react/youth/live/YouthLiveNew'
window.YouthLiveRoomPreview = require 'react/youth/live/YouthLiveRoomPreview'
window.YouthLiveRecords = require 'react/youth/live/YouthLiveRecords'