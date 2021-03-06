# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: publishers
#
#  id                :integer          not null, primary key
#  avatar            :string(255)
#  email             :string(255)
#  alternative_name  :string(255)
#  short_description :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  password          :string(255)
#

class Publisher < ActiveRecord::Base
  # apply_simple_captcha

  validates :email,
    :uniqueness => {
      :message => "此邮箱地址已经被使用"
      },
    :presence => {
      :message => "邮箱地址为必填写项"
    }

  validates :alternative_name,
    :uniqueness => {
      :message => "此用户名已经被使用"
    },
    :presence => {
      :message => "用户名为必填写项"
    },
    :length => {
      :maximum => 50,
      :message => "用户名长度不能超过50字" }

  validates :password,
    :presence => {
      :message => "密码为必填写项"
    }

  has_many :lessonplans

  mount_uploader :avatar, AvatarUploader

  def attachment_filename
    read_attribute(:avatar)
  end

  def avatar_link
    self.avatar_url || '/assets/avatar.png'
  end

  def name
    return self.alternative_name unless self.alternative_name.empty?
  end

  def super_manager?
    self.alternative_name.eql? 'openclass'
  end
end
