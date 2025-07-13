# Use the official Ruby image
FROM ruby:3.3

# Set environment to development
ENV RAILS_ENV=development \
    NODE_ENV=development

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs yarn sqlite3

# Install bundler
RUN gem install bundler

# Copy Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy app source
COPY . .

# Expose default Rails port
EXPOSE 3000

# Run Rails server
CMD ["bin/rails", "server", "-b", "0.0.0.0"]