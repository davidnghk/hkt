class TicketJob < ApplicationJob
  queue_as :default

  def perform(ticket)
    ticket.user.increment!(:unread)
    ActionCable.server.broadcast "ticket_#{ticket.user.id}", 
    #ActionCable.server.broadcast "notification_channel:#{ticket.user_id}", 
      message: render_ticket(ticket), 
      unread: ticket.user.unread
#    TicketMailer.ticket_to_recipient(ticket).deliver_now
#    TicketMailer.ticket_to_recipient(ticket).deliver_later
  end

  private

    def render_ticket(ticket)
      ApplicationController.render(partial: 'tickets/ticket', locals: { ticket: ticket})
    end
end  