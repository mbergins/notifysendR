#' Send a notification with "notify-send"
#'
#' This function builds and runs a notify-send command. This system level
#' function is available on Ubuntu systems and sends a notification to the
#' system. This command is most useful for notifying the user after a long
#' running command has finished.
#'
#' @param summary Optional: Text to include in the title of the nofication,
#'   defaults to "Your Job Completed"
#' @param body Optional: Additional text to include in the body of the
#'   notification
#' @param urgency Optional: Specifies the urgency of the notification (low,
#'   normal or critical). Defaults to low
#' @param time Optional: Duration in milliseconds for the notification to appear
#' @param icon Optional: Specifies an icon to use in the nofication
#' @param category Optional: Specifies the nofication category
#' @param debug Optional: Don't run the command, just print what would have been
#'   run
#' @export
notify_send <- function(summary = NA, body = NA, urgency = 'low', time = NA,
                        icon = NA, category = NA, debug = F) {

  command = paste0("notify-send -u ", urgency);
  if (!is.na(time)) {
    command = paste0(command, " -t '", time, "'");
  }
  if (!is.na(icon)) {
    command = paste0(command, " -i '", icon, "'");
  }
  if (!is.na(category)) {
    command = paste0(command, " -c '", category, "'");
  }

  if (!is.character(summary)) {
    command = paste0(command, " 'Your Job Completed'");
  }

  command = paste0(command, " '",summary,"'");

  if (!is.na(body)) {
    command = paste0(command, " '", body, "'");
  }

  if (debug) {
    print(paste0("Would have run: ", command));
  } else {
    return_val = system(command);
    if (return_val > 0) {
      print(paste0("Problem with running command: ", command));
    }
  }

  if (!is.character(summary)) {
    return(summary)
  }

}
