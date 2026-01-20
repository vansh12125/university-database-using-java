package com.admin;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.utilities.Notice;
import java.util.List;
import org.hibernate.query.Query;

public class NoticeManager {

	public void addNotice(String noticeTitle, String noticeDescription, String course) {
		Session session = AdminFactory.getSession();
		Transaction transaction = session.beginTransaction();
		Notice notice = new Notice(noticeTitle, noticeDescription, course);
		session.persist(notice);
		transaction.commit();
		session.close();
		System.out.println("Noticed Created Success, Notice ID: " + notice.getNoticeId());
	}

	public void deleteNotice(int noticeId) {
		Session session = AdminFactory.getSession();
		Notice notice = session.find(Notice.class, noticeId);
		if (notice != null) {
			Transaction transaction = session.beginTransaction();
			session.remove(notice);
			transaction.commit();
			System.out.println("Removed: " + notice);
		} else {
			System.out.println("Notice not found with ID: " + noticeId);
		}
		session.close();
	}

	public void updateNotice(int noticeId, String title, String description) {
		Session session = AdminFactory.getSession();
		Transaction transaction = session.beginTransaction();
		Notice notice = session.find(Notice.class, noticeId);
		if (notice != null) {
			notice.setNoticeTitle(title);
			notice.setNoticeDescription(description);
			session.merge(notice);
			transaction.commit();
			System.out.println("Updated Notice: " + notice);
		} else {
			System.out.println("Notice not found with ID: " + noticeId);
		}

		session.close();
	}

	public List<Notice> getNoticesByCourse(String course) {
		Session session = AdminFactory.getSession();
		String hql = "FROM Notice WHERE course = :course";
		Query<Notice> query = session.createQuery(hql, Notice.class);
		query.setParameter("course", course);
		List<Notice> notices = query.list();
		session.close();
		return notices;
	}
}
