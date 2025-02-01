defmodule Trivia.QuestionsTest do
  use Trivia.DataCase

  alias Trivia.Questions

  describe "questions" do
    alias Trivia.Questions.Question

    @invalid_attrs %{question: nil, answer: nil}

    test "list_questions/0 returns all questions" do
      question = insert(:question)
      assert Questions.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = insert(:question)
      assert Questions.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      valid_attrs = %{question: "some question", answer: "some answer"}

      assert {:ok, %Question{} = question} = Questions.create_question(valid_attrs)
      assert question.question == "some question"
      assert question.answer == "some answer"
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Questions.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = insert(:question)
      update_attrs = %{question: "some updated question", answer: "some updated answer"}

      assert {:ok, %Question{} = question} = Questions.update_question(question, update_attrs)
      assert question.question == "some updated question"
      assert question.answer == "some updated answer"
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = insert(:question)
      assert {:error, %Ecto.Changeset{}} = Questions.update_question(question, @invalid_attrs)
      assert question == Questions.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = insert(:question)
      assert {:ok, %Question{}} = Questions.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Questions.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = insert(:question)
      assert %Ecto.Changeset{} = Questions.change_question(question)
    end
  end
end
