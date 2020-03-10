(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort character 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (character character) Bool)

(declare-const dummy2 character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep (select a temp___idx_91)) (to_rep
                                                                (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                             (of_rep1 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                   (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((string____ref 0))
(((string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(declare-fun to_string (us_image Int) us_t)

(declare-fun from_string (us_t) us_image)

;; to_string__first
  (assert
  (forall ((x us_image))
  (forall ((s Int))
  (! (= (first1 (to_string x s)) 1) :pattern ((to_string x s)) ))))

;; to_string__length
  (assert
  (forall ((x us_image))
  (forall ((s Int))
  (! (=> (<= 0 s) (<= (length1 (to_string x s)) s)) :pattern ((to_string x s)) ))))

(declare-fun concat1 ((Array Int character) Int Int (Array Int character) Int
  Int) (Array Int character))

;; concat_def
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (forall ((i Int))
  (! (and
     (=> (and (<= a_first i) (<= i a_last))
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select a i)))
     (=> (< a_last i)
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select b (+ (- i a_last) (- b_first 1)))))) :pattern ((select 
  (concat1 a a_first a_last b b_first b_last) i)) )))))

(declare-fun concat_singleton_left (character Int (Array Int character) Int
  Int) (Array Int character))

;; concat_singleton_left_def
  (assert
  (forall ((a character))
  (forall ((b (Array Int character)))
  (forall ((a_first Int) (b_first Int) (b_last Int))
  (! (and
     (= (select (concat_singleton_left a a_first b b_first b_last) a_first) a)
     (forall ((i Int))
     (! (=> (< a_first i)
        (= (select (concat_singleton_left a a_first b b_first b_last) i) (select b (+ (- i a_first) (- b_first 1))))) :pattern ((select 
     (concat_singleton_left a a_first b b_first b_last) i)) ))) :pattern (
  (concat_singleton_left a a_first b b_first b_last)) )))))

(declare-fun concat_singleton_right ((Array Int character) Int Int
  character) (Array Int character))

;; concat_singleton_right_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((b character))
  (forall ((a_first Int) (a_last Int))
  (! (and
     (= (select (concat_singleton_right a a_first a_last b) (+ a_last 1)) b)
     (forall ((i Int))
     (! (=> (and (<= a_first i) (<= i a_last))
        (= (select (concat_singleton_right a a_first a_last b) i) (select a i))) :pattern ((select 
     (concat_singleton_right a a_first a_last b) i)) :pattern ((select a i)) ))) :pattern (
  (concat_singleton_right a a_first a_last b)) )))))

(declare-fun concat_singletons (character Int
  character) (Array Int character))

;; concat_singletons_def
  (assert
  (forall ((a character) (b character))
  (forall ((a_first Int))
  (! (and (= (select (concat_singletons a a_first b) a_first) a)
     (= (select (concat_singletons a a_first b) (+ a_first 1)) b)) :pattern (
  (concat_singletons a a_first b)) ))))

(declare-fun singleton1 (character Int) (Array Int character))

;; singleton_def
  (assert
  (forall ((v character))
  (forall ((i Int))
  (! (= (select (singleton1 v i) i) v) :pattern ((select (singleton1 v i) i)) ))))

(define-fun in_range3 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Bool)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__spark04__data__ai__is_null_pointer Bool)(rec__spark04__data__ai__pointer_address Int)(rec__spark04__data__ai__pointer_value integer)))))
(define-fun us_rep_rec__spark04__data__ai__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__spark04__data__ai__is_null_pointer a))

(define-fun us_rep_rec__spark04__data__ai__pointer_address__projection ((a us_rep)) Int 
  (rec__spark04__data__ai__pointer_address a))

(define-fun us_rep_rec__spark04__data__ai__pointer_value__projection ((a us_rep)) integer 
  (rec__spark04__data__ai__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__spark04__data__ai__is_null_pointer a) 
                        (rec__spark04__data__ai__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__spark04__data__ai__is_null_pointer a) true))
                        (and
                        (= (rec__spark04__data__ai__pointer_address a) 
                        (rec__spark04__data__ai__pointer_address b))
                        (= (rec__spark04__data__ai__pointer_value a) 
                        (rec__spark04__data__ai__pointer_value b)))))
                   true false))

(define-fun rec__spark04__data__ai__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__spark04__data__ai__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert (= (rec__spark04__data__ai__is_null_pointer us_null_pointer) true))

(declare-const dummy4 us_rep)

(declare-datatypes ((ai__ref 0))
(((ai__refqtmk (ai__content us_rep)))))
(define-fun ai__ref_ai__content__projection ((a ai__ref)) us_rep (ai__content
                                                                 a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__spark04__data__point__x integer)(rec__spark04__data__point__y integer)))))
(define-fun us_split_fields_rec__spark04__data__point__x__projection ((a us_split_fields)) integer 
  (rec__spark04__data__point__x a))

(define-fun us_split_fields_rec__spark04__data__point__y__projection ((a us_split_fields)) integer 
  (rec__spark04__data__point__y a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep1
                            (rec__spark04__data__point__x
                            (us_split_fields1 a))) (to_rep1
                                                   (rec__spark04__data__point__x
                                                   (us_split_fields1 b))))
                         (= (to_rep1
                            (rec__spark04__data__point__y
                            (us_split_fields1 a))) (to_rep1
                                                   (rec__spark04__data__point__y
                                                   (us_split_fields1 b)))))
                    true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const spark04__data__point__x__first__bit Int)

(declare-const spark04__data__point__x__last__bit Int)

(declare-const spark04__data__point__x__position Int)

;; spark04__data__point__x__first__bit_axiom
  (assert (<= 0 spark04__data__point__x__first__bit))

;; spark04__data__point__x__last__bit_axiom
  (assert
  (< spark04__data__point__x__first__bit spark04__data__point__x__last__bit))

;; spark04__data__point__x__position_axiom
  (assert (<= 0 spark04__data__point__x__position))

(declare-const spark04__data__point__y__first__bit Int)

(declare-const spark04__data__point__y__last__bit Int)

(declare-const spark04__data__point__y__position Int)

;; spark04__data__point__y__first__bit_axiom
  (assert (<= 0 spark04__data__point__y__first__bit))

;; spark04__data__point__y__last__bit_axiom
  (assert
  (< spark04__data__point__y__first__bit spark04__data__point__y__last__bit))

;; spark04__data__point__y__position_axiom
  (assert (<= 0 spark04__data__point__y__position))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((point__ref 0))
(((point__refqtmk (point__content us_rep1)))))
(define-fun point__ref_point__content__projection ((a point__ref)) us_rep1 
  (point__content a))

(declare-fun createpoint (us_rep us_rep) us_rep1)

(declare-fun createpoint__function_guard (us_rep1 us_rep us_rep) Bool)

(define-fun default_initial_assumption ((temp___expr_178 us_rep)
  (temp___skip_top_level_179 Bool)) Bool (= (rec__spark04__data__ai__is_null_pointer
                                            temp___expr_178) true))

;; createpoint__post_axiom
  (assert true)

;; createpoint__def_axiom
  (assert
  (forall ((x us_rep) (y us_rep))
  (! (= (createpoint x y) (us_repqtmk1
                          (us_split_fieldsqtmk
                          (rec__spark04__data__ai__pointer_value x)
                          (rec__spark04__data__ai__pointer_value y)))) :pattern (
  (createpoint x y)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun line_length (us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun line_length__function_guard (Int us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(declare-fun page_length (us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun page_length__function_guard (Int us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(declare-fun temp___String_Literal_185 (tuple0) (Array Int character))

;; temp___String_Literal_185__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_185 us_void_param) 1)) 80)
     (= (to_rep (select (temp___String_Literal_185 us_void_param) 2)) 46))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_185 us_void_param) 3)) 88)
     (= (to_rep (select (temp___String_Literal_185 us_void_param) 4)) 32))
     (= (to_rep (select (temp___String_Literal_185 us_void_param) 5)) 61))) :pattern (
  (temp___String_Literal_185 us_void_param)) )))

(declare-fun temp___String_Literal_188 (tuple0) (Array Int character))

;; temp___String_Literal_188__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_188 us_void_param) 1)) 44)
     (= (to_rep (select (temp___String_Literal_188 us_void_param) 2)) 32))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_188 us_void_param) 3)) 80)
     (= (to_rep (select (temp___String_Literal_188 us_void_param) 4)) 46))
     (= (to_rep (select (temp___String_Literal_188 us_void_param) 5)) 89))
     (and
     (= (to_rep (select (temp___String_Literal_188 us_void_param) 6)) 32)
     (= (to_rep (select (temp___String_Literal_188 us_void_param) 7)) 61)))) :pattern (
  (temp___String_Literal_188 us_void_param)) )))

(declare-fun temp___String_Literal_193 (tuple0) (Array Int character))

;; temp___String_Literal_193__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 1)) 44)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 2)) 32))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 3)) 65)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 4)) 88))
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 5)) 46)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 6)) 97)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 7)) 108)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 8)) 108))
     (and
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 9)) 32)
     (= (to_rep (select (temp___String_Literal_193 us_void_param) 10)) 61))))) :pattern (
  (temp___String_Literal_193 us_void_param)) )))

(declare-fun temp___String_Literal_198 (tuple0) (Array Int character))

;; temp___String_Literal_198__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_198 us_void_param) 1)) 44)
     (= (to_rep (select (temp___String_Literal_198 us_void_param) 2)) 32))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_198 us_void_param) 3)) 65)
     (= (to_rep (select (temp___String_Literal_198 us_void_param) 4)) 89))
     (and
     (= (to_rep (select (temp___String_Literal_198 us_void_param) 5)) 46)
     (= (to_rep (select (temp___String_Literal_198 us_void_param) 6)) 97)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_198 us_void_param) 7)) 108)
     (= (to_rep (select (temp___String_Literal_198 us_void_param) 8)) 108))
     (and
     (= (to_rep (select (temp___String_Literal_198 us_void_param) 9)) 32)
     (= (to_rep (select (temp___String_Literal_198 us_void_param) 10)) 61))))) :pattern (
  (temp___String_Literal_198 us_void_param)) )))

(declare-fun temp___String_Literal_207 (tuple0) (Array Int character))

;; temp___String_Literal_207__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_207 us_void_param) 1)) 80)
     (= (to_rep (select (temp___String_Literal_207 us_void_param) 2)) 46))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_207 us_void_param) 3)) 88)
     (= (to_rep (select (temp___String_Literal_207 us_void_param) 4)) 32))
     (= (to_rep (select (temp___String_Literal_207 us_void_param) 5)) 61))) :pattern (
  (temp___String_Literal_207 us_void_param)) )))

(declare-fun temp___String_Literal_210 (tuple0) (Array Int character))

;; temp___String_Literal_210__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_210 us_void_param) 1)) 44)
     (= (to_rep (select (temp___String_Literal_210 us_void_param) 2)) 32))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_210 us_void_param) 3)) 80)
     (= (to_rep (select (temp___String_Literal_210 us_void_param) 4)) 46))
     (= (to_rep (select (temp___String_Literal_210 us_void_param) 5)) 89))
     (and
     (= (to_rep (select (temp___String_Literal_210 us_void_param) 6)) 32)
     (= (to_rep (select (temp___String_Literal_210 us_void_param) 7)) 61)))) :pattern (
  (temp___String_Literal_210 us_void_param)) )))

(declare-fun temp___String_Literal_215 (tuple0) (Array Int character))

;; temp___String_Literal_215__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_215 us_void_param) 1)) 44)
     (= (to_rep (select (temp___String_Literal_215 us_void_param) 2)) 32))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_215 us_void_param) 3)) 65)
     (= (to_rep (select (temp___String_Literal_215 us_void_param) 4)) 88))
     (and
     (= (to_rep (select (temp___String_Literal_215 us_void_param) 5)) 46)
     (= (to_rep (select (temp___String_Literal_215 us_void_param) 6)) 97)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_215 us_void_param) 7)) 108)
     (= (to_rep (select (temp___String_Literal_215 us_void_param) 8)) 108))
     (and
     (= (to_rep (select (temp___String_Literal_215 us_void_param) 9)) 32)
     (= (to_rep (select (temp___String_Literal_215 us_void_param) 10)) 61))))) :pattern (
  (temp___String_Literal_215 us_void_param)) )))

(declare-fun temp___String_Literal_220 (tuple0) (Array Int character))

;; temp___String_Literal_220__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_220 us_void_param) 1)) 44)
     (= (to_rep (select (temp___String_Literal_220 us_void_param) 2)) 32))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_220 us_void_param) 3)) 65)
     (= (to_rep (select (temp___String_Literal_220 us_void_param) 4)) 89))
     (and
     (= (to_rep (select (temp___String_Literal_220 us_void_param) 5)) 46)
     (= (to_rep (select (temp___String_Literal_220 us_void_param) 6)) 97)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_220 us_void_param) 7)) 108)
     (= (to_rep (select (temp___String_Literal_220 us_void_param) 8)) 108))
     (and
     (= (to_rep (select (temp___String_Literal_220 us_void_param) 9)) 32)
     (= (to_rep (select (temp___String_Literal_220 us_void_param) 10)) 61))))) :pattern (
  (temp___String_Literal_220 us_void_param)) )))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(define-fun dynamic_invariant2 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range2 temp___expr_74)))

(define-fun dynamic_invariant3 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(declare-sort count 0)

(declare-fun countqtint (count) Int)

;; count'axiom
  (assert
  (forall ((i count))
  (and (<= 0 (countqtint i)) (<= (countqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (count count) Bool)

(declare-const dummy6 count)

(declare-datatypes ((count__ref 0))
(((count__refqtmk (count__content count)))))
(define-fun count__ref_count__content__projection ((a count__ref)) count 
  (count__content a))

(define-fun dynamic_invariant4 ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 0 2147483647)) (in_range4
                                     temp___expr_161)))

;; line_length__post_axiom
  (assert
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private)
  (ada___ada__text_io__file_system us_private)) (! (dynamic_invariant4
  (line_length ada___ada__text_io__standard_in
  ada___ada__text_io__standard_out ada___ada__text_io__standard_err
  ada___ada__text_io__current_in ada___ada__text_io__current_out
  ada___ada__text_io__current_err ada___ada__text_io__file_system) true false
  true
  true) :pattern ((line_length ada___ada__text_io__standard_in
                  ada___ada__text_io__standard_out
                  ada___ada__text_io__standard_err
                  ada___ada__text_io__current_in
                  ada___ada__text_io__current_out
                  ada___ada__text_io__current_err
                  ada___ada__text_io__file_system)) )))

;; page_length__post_axiom
  (assert
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private)
  (ada___ada__text_io__file_system us_private)) (! (dynamic_invariant4
  (page_length ada___ada__text_io__standard_in
  ada___ada__text_io__standard_out ada___ada__text_io__standard_err
  ada___ada__text_io__current_in ada___ada__text_io__current_out
  ada___ada__text_io__current_err ada___ada__text_io__file_system) true false
  true
  true) :pattern ((page_length ada___ada__text_io__standard_in
                  ada___ada__text_io__standard_out
                  ada___ada__text_io__standard_err
                  ada___ada__text_io__current_in
                  ada___ada__text_io__current_out
                  ada___ada__text_io__current_err
                  ada___ada__text_io__file_system)) )))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 42))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 40))

(assert
;; defqtvc
 ;; File "spark04.ads", line 21, characters 0-0
  (not
  (forall ((ax__pointer_value integer) (ax__pointer_address Int)
  (ax__is_null_pointer Bool) (ay__pointer_value integer)
  (ay__pointer_address Int) (ay__is_null_pointer Bool)
  (standard_in us_private) (standard_out us_private)
  (standard_err us_private) (current_in us_private) (current_out us_private)
  (current_err us_private) (file_system us_private))
  (let ((o (us_repqtmk ay__is_null_pointer ay__pointer_address
           ay__pointer_value)))
  (let ((o1 (us_repqtmk ax__is_null_pointer ax__pointer_address
            ax__pointer_value)))
  (let ((temp___184 (createpoint o1 o)))
  (=>
  (and (createpoint__function_guard temp___184 o1 o)
  (= temp___184 (us_repqtmk1
                (us_split_fieldsqtmk ax__pointer_value ay__pointer_value))))
  (forall ((p__split_fields us_split_fields))
  (=> (= p__split_fields (us_split_fields1 temp___184))
  (=>
  (exists ((o2 Int))
  (and (= (to_rep1 ay__pointer_value) o2)
  (let ((temp___202 (to_string (attr__ATTRIBUTE_IMAGE o2) 12)))
  (exists ((temp___201 us_t))
  (and
  (let ((temp___200 (temp___String_Literal_198 Tuple0)))
  (exists ((temp___199 us_t))
  (and
  (exists ((o3 Int))
  (and (= (to_rep1 ax__pointer_value) o3)
  (let ((temp___197 (to_string (attr__ATTRIBUTE_IMAGE o3) 12)))
  (exists ((temp___196 us_t))
  (and
  (let ((temp___195 (temp___String_Literal_193 Tuple0)))
  (exists ((temp___194 us_t))
  (and
  (exists ((o4 Int))
  (and (= (to_rep1 (rec__spark04__data__point__y p__split_fields)) o4)
  (let ((temp___192 (to_string (attr__ATTRIBUTE_IMAGE o4) 12)))
  (exists ((temp___191 us_t))
  (and
  (let ((temp___190 (temp___String_Literal_188 Tuple0)))
  (exists ((o5 Int))
  (and (= (to_rep1 (rec__spark04__data__point__x p__split_fields)) o5)
  (let ((temp___187 (to_string (attr__ATTRIBUTE_IMAGE o5) 12)))
  (let ((o6 (- (+ 1 (+ (length 1 5) (length (first1 temp___187)
                                    (last1 temp___187)))) 1)))
  (and (in_range1 o6)
  (let ((temp___189 (of_array
                    (concat1 (temp___String_Literal_185 Tuple0) 1 5
                    (to_array temp___187) (first1 temp___187)
                    (last1 temp___187)) 1 o6)))
  (ite (= (length1 temp___189) 0) (= temp___191 (of_array temp___190 1 7))
  (let ((o7 (- (+ (first1 temp___189) (+ (length (first1 temp___189)
                                         (last1 temp___189)) (length 1 7))) 1)))
  (and (in_range1 o7)
  (= temp___191 (of_array
                (concat1 (to_array temp___189) (first1 temp___189)
                (last1 temp___189) temp___190 1 7) (first1 temp___189) o7))))))))))))
  (ite (= (length1 temp___191) 0)
  (= temp___194 (of_array (to_array temp___192) (first1 temp___192)
                (last1 temp___192)))
  (let ((o5 (- (+ (first1 temp___191) (+ (length (first1 temp___191)
                                         (last1 temp___191)) (length
                                                             (first1
                                                             temp___192)
                                                             (last1
                                                             temp___192)))) 1)))
  (and (in_range1 o5)
  (= temp___194 (of_array
                (concat1 (to_array temp___191) (first1 temp___191)
                (last1 temp___191) (to_array temp___192) (first1 temp___192)
                (last1 temp___192)) (first1 temp___191) o5))))))))))
  (ite (= (length1 temp___194) 0) (= temp___196 (of_array temp___195 1 10))
  (let ((o4 (- (+ (first1 temp___194) (+ (length (first1 temp___194)
                                         (last1 temp___194)) (length 1 10))) 1)))
  (and (in_range1 o4)
  (= temp___196 (of_array
                (concat1 (to_array temp___194) (first1 temp___194)
                (last1 temp___194) temp___195 1 10) (first1 temp___194) o4))))))))
  (ite (= (length1 temp___196) 0)
  (= temp___199 (of_array (to_array temp___197) (first1 temp___197)
                (last1 temp___197)))
  (let ((o4 (- (+ (first1 temp___196) (+ (length (first1 temp___196)
                                         (last1 temp___196)) (length
                                                             (first1
                                                             temp___197)
                                                             (last1
                                                             temp___197)))) 1)))
  (and (in_range1 o4)
  (= temp___199 (of_array
                (concat1 (to_array temp___196) (first1 temp___196)
                (last1 temp___196) (to_array temp___197) (first1 temp___197)
                (last1 temp___197)) (first1 temp___196) o4))))))))))
  (ite (= (length1 temp___199) 0) (= temp___201 (of_array temp___200 1 10))
  (let ((o3 (- (+ (first1 temp___199) (+ (length (first1 temp___199)
                                         (last1 temp___199)) (length 1 10))) 1)))
  (and (in_range1 o3)
  (= temp___201 (of_array
                (concat1 (to_array temp___199) (first1 temp___199)
                (last1 temp___199) temp___200 1 10) (first1 temp___199) o3))))))))
  (or (= (length1 temp___201) 0) (in_range1
  (- (+ (first1 temp___201) (+ (length (first1 temp___201)
                               (last1 temp___201)) (length
                                                   (first1 temp___202)
                                                   (last1 temp___202)))) 1))))))))
  (forall ((standard_in1 us_private) (standard_out1 us_private)
  (standard_err1 us_private) (current_in1 us_private)
  (current_out1 us_private) (current_err1 us_private)
  (file_system1 us_private))
  (=>
  (and
  (= (line_length standard_in standard_out standard_err current_in
     current_out current_err file_system) (line_length standard_in1
                                          standard_out1 standard_err1
                                          current_in1 current_out1
                                          current_err1 file_system1))
  (= (page_length standard_in standard_out standard_err current_in
     current_out current_err file_system) (page_length standard_in1
                                          standard_out1 standard_err1
                                          current_in1 current_out1
                                          current_err1 file_system1)))
  (forall ((ay__pointer_value1 integer))
  (=> (= ay__pointer_value1 rliteral)
  (forall ((ax__pointer_value1 integer))
  (=> (= ax__pointer_value1 rliteral1)
  (forall ((o2 Int))
  (=> (= (to_rep1 ay__pointer_value1) o2)
  (forall ((o3 Int))
  (=> (= (to_rep1 ax__pointer_value1) o3)
  (let ((temp___219 (to_string (attr__ATTRIBUTE_IMAGE o3) 12)))
  (forall ((temp___218 us_t))
  (=>
  (let ((temp___217 (temp___String_Literal_215 Tuple0)))
  (exists ((temp___216 us_t))
  (and
  (exists ((o4 Int))
  (and (= (to_rep1 (rec__spark04__data__point__y p__split_fields)) o4)
  (let ((temp___214 (to_string (attr__ATTRIBUTE_IMAGE o4) 12)))
  (exists ((temp___213 us_t))
  (and
  (let ((temp___212 (temp___String_Literal_210 Tuple0)))
  (exists ((o5 Int))
  (and (= (to_rep1 (rec__spark04__data__point__x p__split_fields)) o5)
  (let ((temp___209 (to_string (attr__ATTRIBUTE_IMAGE o5) 12)))
  (let ((o6 (- (+ 1 (+ (length 1 5) (length (first1 temp___209)
                                    (last1 temp___209)))) 1)))
  (and (in_range1 o6)
  (let ((temp___211 (of_array
                    (concat1 (temp___String_Literal_207 Tuple0) 1 5
                    (to_array temp___209) (first1 temp___209)
                    (last1 temp___209)) 1 o6)))
  (ite (= (length1 temp___211) 0) (= temp___213 (of_array temp___212 1 7))
  (let ((o7 (- (+ (first1 temp___211) (+ (length (first1 temp___211)
                                         (last1 temp___211)) (length 1 7))) 1)))
  (and (in_range1 o7)
  (= temp___213 (of_array
                (concat1 (to_array temp___211) (first1 temp___211)
                (last1 temp___211) temp___212 1 7) (first1 temp___211) o7))))))))))))
  (ite (= (length1 temp___213) 0)
  (= temp___216 (of_array (to_array temp___214) (first1 temp___214)
                (last1 temp___214)))
  (let ((o5 (- (+ (first1 temp___213) (+ (length (first1 temp___213)
                                         (last1 temp___213)) (length
                                                             (first1
                                                             temp___214)
                                                             (last1
                                                             temp___214)))) 1)))
  (and (in_range1 o5)
  (= temp___216 (of_array
                (concat1 (to_array temp___213) (first1 temp___213)
                (last1 temp___213) (to_array temp___214) (first1 temp___214)
                (last1 temp___214)) (first1 temp___213) o5))))))))))
  (ite (= (length1 temp___216) 0) (= temp___218 (of_array temp___217 1 10))
  (let ((o4 (- (+ (first1 temp___216) (+ (length (first1 temp___216)
                                         (last1 temp___216)) (length 1 10))) 1)))
  (and (in_range1 o4)
  (= temp___218 (of_array
                (concat1 (to_array temp___216) (first1 temp___216)
                (last1 temp___216) temp___217 1 10) (first1 temp___216) o4))))))))
  (=> (not (= (length1 temp___218) 0)) (in_range1
  (- (+ (first1 temp___218) (+ (length (first1 temp___218)
                               (last1 temp___218)) (length
                                                   (first1 temp___219)
                                                   (last1 temp___219)))) 1))))))))))))))))))))))))))
(check-sat)
(exit)
