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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun in_range3 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Bool)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__n02__data__ai__is_null_pointer Bool)(rec__n02__data__ai__pointer_address Int)(rec__n02__data__ai__pointer_value integer)))))
(define-fun us_rep_rec__n02__data__ai__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__n02__data__ai__is_null_pointer a))

(define-fun us_rep_rec__n02__data__ai__pointer_address__projection ((a us_rep)) Int 
  (rec__n02__data__ai__pointer_address a))

(define-fun us_rep_rec__n02__data__ai__pointer_value__projection ((a us_rep)) integer 
  (rec__n02__data__ai__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__n02__data__ai__is_null_pointer a) (rec__n02__data__ai__is_null_pointer
                                                                   b))
                        (=>
                        (not
                        (= (rec__n02__data__ai__is_null_pointer a) true))
                        (and
                        (= (rec__n02__data__ai__pointer_address a) (rec__n02__data__ai__pointer_address
                                                                   b))
                        (= (rec__n02__data__ai__pointer_value a) (rec__n02__data__ai__pointer_value
                                                                 b)))))
                   true false))

(define-fun rec__n02__data__ai__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__n02__data__ai__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert (= (rec__n02__data__ai__is_null_pointer us_null_pointer) true))

(declare-const dummy4 us_rep)

(declare-datatypes ((ai__ref 0))
(((ai__refqtmk (ai__content us_rep)))))
(define-fun ai__ref_ai__content__projection ((a ai__ref)) us_rep (ai__content
                                                                 a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__n02__data__mystruct__a us_rep)(rec__n02__data__mystruct__b us_rep)))))
(define-fun us_split_fields_rec__n02__data__mystruct__a__projection ((a us_split_fields)) us_rep 
  (rec__n02__data__mystruct__a a))

(define-fun us_split_fields_rec__n02__data__mystruct__b__projection ((a us_split_fields)) us_rep 
  (rec__n02__data__mystruct__b a))

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
                         (= (bool_eq2
                            (rec__n02__data__mystruct__a
                            (us_split_fields1 a))
                            (rec__n02__data__mystruct__a
                            (us_split_fields1 b))) true)
                         (= (bool_eq2
                            (rec__n02__data__mystruct__b
                            (us_split_fields1 a))
                            (rec__n02__data__mystruct__b
                            (us_split_fields1 b))) true))
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

(declare-const n02__data__mystruct__a__first__bit Int)

(declare-const n02__data__mystruct__a__last__bit Int)

(declare-const n02__data__mystruct__a__position Int)

;; n02__data__mystruct__a__first__bit_axiom
  (assert (<= 0 n02__data__mystruct__a__first__bit))

;; n02__data__mystruct__a__last__bit_axiom
  (assert
  (< n02__data__mystruct__a__first__bit n02__data__mystruct__a__last__bit))

;; n02__data__mystruct__a__position_axiom
  (assert (<= 0 n02__data__mystruct__a__position))

(declare-const n02__data__mystruct__b__first__bit Int)

(declare-const n02__data__mystruct__b__last__bit Int)

(declare-const n02__data__mystruct__b__position Int)

;; n02__data__mystruct__b__first__bit_axiom
  (assert (<= 0 n02__data__mystruct__b__first__bit))

;; n02__data__mystruct__b__last__bit_axiom
  (assert
  (< n02__data__mystruct__b__first__bit n02__data__mystruct__b__last__bit))

;; n02__data__mystruct__b__position_axiom
  (assert (<= 0 n02__data__mystruct__b__position))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((mystruct__ref 0))
(((mystruct__refqtmk (mystruct__content us_rep1)))))
(define-fun mystruct__ref_mystruct__content__projection ((a mystruct__ref)) us_rep1 
  (mystruct__content a))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const y__pointer_address Int)

(declare-const y__is_null_pointer Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-fun line_length (us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun line_length__function_guard (Int us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(declare-fun page_length (us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun page_length__function_guard (Int us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(define-fun dynamic_invariant ((temp___expr_188 us_rep)
  (temp___is_init_184 Bool) (temp___skip_constant_185 Bool)
  (temp___do_toplevel_186 Bool)
  (temp___do_typ_inv_187 Bool)) Bool (not
                                     (= (rec__n02__data__ai__is_null_pointer
                                        temp___expr_188) true)))

(define-fun default_initial_assumption ((temp___expr_189 us_rep)
  (temp___skip_top_level_190 Bool)) Bool (= (rec__n02__data__ai__is_null_pointer
                                            temp___expr_189) true))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2
  (rec__n02__data__am__is_null_pointer Bool)(rec__n02__data__am__pointer_address Int)(rec__n02__data__am__pointer_value us_rep1)))))
(define-fun us_rep_rec__n02__data__am__is_null_pointer__projection ((a us_rep2)) Bool 
  (rec__n02__data__am__is_null_pointer a))

(define-fun us_rep_rec__n02__data__am__pointer_address__projection ((a us_rep2)) Int 
  (rec__n02__data__am__pointer_address a))

(define-fun us_rep_rec__n02__data__am__pointer_value__projection ((a us_rep2)) us_rep1 
  (rec__n02__data__am__pointer_value a))

(declare-datatypes ((us_rep__ref1 0))
(((us_rep__refqtmk1 (us_rep__content1 us_rep2)))))
(define-fun us_rep__ref___rep__content__2__projection ((a us_rep__ref1)) us_rep2 
  (us_rep__content1 a))

(define-fun bool_eq4 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (rec__n02__data__am__is_null_pointer a) (rec__n02__data__am__is_null_pointer
                                                                    b))
                         (=>
                         (not
                         (= (rec__n02__data__am__is_null_pointer a) true))
                         (and
                         (= (rec__n02__data__am__pointer_address a) (rec__n02__data__am__pointer_address
                                                                    b))
                         (= (rec__n02__data__am__pointer_value a) (rec__n02__data__am__pointer_value
                                                                  b)))))
                    true false))

(define-fun rec__n02__data__am__pointer_value__pred ((a us_rep2)) Bool 
  (not (= (rec__n02__data__am__is_null_pointer a) true)))

(declare-const us_null_pointer1 us_rep2)

;; __null_pointer__def_axiom
  (assert (= (rec__n02__data__am__is_null_pointer us_null_pointer1) true))

(declare-const dummy6 us_rep2)

(declare-datatypes ((am__ref 0))
(((am__refqtmk (am__content us_rep2)))))
(define-fun am__ref_am__content__projection ((a am__ref)) us_rep2 (am__content
                                                                  a))

(define-fun dynamic_invariant1 ((temp___expr_204 us_rep2)
  (temp___is_init_200 Bool) (temp___skip_constant_201 Bool)
  (temp___do_toplevel_202 Bool)
  (temp___do_typ_inv_203 Bool)) Bool (and
                                     (not
                                     (= (rec__n02__data__am__is_null_pointer
                                        temp___expr_204) true))
                                     (=>
                                     (not
                                     (= (rec__n02__data__am__is_null_pointer
                                        temp___expr_204) true))
                                     (and
                                     (not
                                     (= (rec__n02__data__ai__is_null_pointer
                                        (rec__n02__data__mystruct__a
                                        (us_split_fields1
                                        (rec__n02__data__am__pointer_value
                                        temp___expr_204)))) true))
                                     (not
                                     (= (rec__n02__data__ai__is_null_pointer
                                        (rec__n02__data__mystruct__b
                                        (us_split_fields1
                                        (rec__n02__data__am__pointer_value
                                        temp___expr_204)))) true))))))

(define-fun default_initial_assumption1 ((temp___expr_205 us_rep2)
  (temp___skip_top_level_206 Bool)) Bool (= (rec__n02__data__am__is_null_pointer
                                            temp___expr_205) true))

(declare-fun temp___String_Literal_213 (tuple0) (Array Int character))

;; temp___String_Literal_213__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_213 us_void_param) 1)) 88)
     (= (to_rep (select (temp___String_Literal_213 us_void_param) 2)) 46))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_213 us_void_param) 3)) 97)
     (= (to_rep (select (temp___String_Literal_213 us_void_param) 4)) 108))
     (and
     (= (to_rep (select (temp___String_Literal_213 us_void_param) 5)) 108)
     (= (to_rep (select (temp___String_Literal_213 us_void_param) 6)) 46)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_213 us_void_param) 7)) 65)
     (= (to_rep (select (temp___String_Literal_213 us_void_param) 8)) 32))
     (= (to_rep (select (temp___String_Literal_213 us_void_param) 9)) 61)))) :pattern (
  (temp___String_Literal_213 us_void_param)) )))

(declare-fun temp___String_Literal_216 (tuple0) (Array Int character))

;; temp___String_Literal_216__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_216 us_void_param) 1)) 44)
     (= (to_rep (select (temp___String_Literal_216 us_void_param) 2)) 32))
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_216 us_void_param) 3)) 88)
     (= (to_rep (select (temp___String_Literal_216 us_void_param) 4)) 46))
     (= (to_rep (select (temp___String_Literal_216 us_void_param) 5)) 97))
     (and
     (= (to_rep (select (temp___String_Literal_216 us_void_param) 6)) 108)
     (= (to_rep (select (temp___String_Literal_216 us_void_param) 7)) 108)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_216 us_void_param) 8)) 46)
     (= (to_rep (select (temp___String_Literal_216 us_void_param) 9)) 66))
     (and
     (= (to_rep (select (temp___String_Literal_216 us_void_param) 10)) 32)
     (= (to_rep (select (temp___String_Literal_216 us_void_param) 11)) 61))))) :pattern (
  (temp___String_Literal_216 us_void_param)) )))

(declare-fun temp___String_Literal_221 (tuple0) (Array Int character))

;; temp___String_Literal_221__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_221 us_void_param) 1)) 44)
     (= (to_rep (select (temp___String_Literal_221 us_void_param) 2)) 32))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_221 us_void_param) 3)) 89)
     (= (to_rep (select (temp___String_Literal_221 us_void_param) 4)) 46))
     (and
     (= (to_rep (select (temp___String_Literal_221 us_void_param) 5)) 97)
     (= (to_rep (select (temp___String_Literal_221 us_void_param) 6)) 108)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_221 us_void_param) 7)) 108)
     (= (to_rep (select (temp___String_Literal_221 us_void_param) 8)) 32))
     (= (to_rep (select (temp___String_Literal_221 us_void_param) 9)) 61)))) :pattern (
  (temp___String_Literal_221 us_void_param)) )))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant3 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(define-fun dynamic_invariant4 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range2 temp___expr_74)))

(define-fun dynamic_invariant5 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(define-fun dynamic_invariant6 ((temp___expr_195 us_rep1)
  (temp___is_init_191 Bool) (temp___skip_constant_192 Bool)
  (temp___do_toplevel_193 Bool)
  (temp___do_typ_inv_194 Bool)) Bool (and
                                     (not
                                     (= (rec__n02__data__ai__is_null_pointer
                                        (rec__n02__data__mystruct__a
                                        (us_split_fields1 temp___expr_195))) true))
                                     (not
                                     (= (rec__n02__data__ai__is_null_pointer
                                        (rec__n02__data__mystruct__b
                                        (us_split_fields1 temp___expr_195))) true))))

(define-fun default_initial_assumption2 ((temp___expr_196 us_rep1)
  (temp___skip_top_level_197 Bool)) Bool (and
                                         (= (rec__n02__data__ai__is_null_pointer
                                            (rec__n02__data__mystruct__a
                                            (us_split_fields1
                                            temp___expr_196))) true)
                                         (= (rec__n02__data__ai__is_null_pointer
                                            (rec__n02__data__mystruct__b
                                            (us_split_fields1
                                            temp___expr_196))) true)))

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

(declare-const dummy7 count)

(declare-datatypes ((count__ref 0))
(((count__refqtmk (count__content count)))))
(define-fun count__ref_count__content__projection ((a count__ref)) count 
  (count__content a))

(define-fun dynamic_invariant7 ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= 0 2147483647)) (in_range4
                                     temp___expr_160)))

;; line_length__post_axiom
  (assert
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private)) (! (dynamic_invariant7
  (line_length ada___ada__text_io__standard_in
  ada___ada__text_io__file_system ada___ada__text_io__standard_out
  ada___ada__text_io__standard_err ada___ada__text_io__current_in
  ada___ada__text_io__current_out ada___ada__text_io__current_err) true false
  true
  true) :pattern ((line_length ada___ada__text_io__standard_in
                  ada___ada__text_io__file_system
                  ada___ada__text_io__standard_out
                  ada___ada__text_io__standard_err
                  ada___ada__text_io__current_in
                  ada___ada__text_io__current_out
                  ada___ada__text_io__current_err)) )))

;; page_length__post_axiom
  (assert
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private)) (! (dynamic_invariant7
  (page_length ada___ada__text_io__standard_in
  ada___ada__text_io__file_system ada___ada__text_io__standard_out
  ada___ada__text_io__standard_err ada___ada__text_io__current_in
  ada___ada__text_io__current_out ada___ada__text_io__current_err) true false
  true
  true) :pattern ((page_length ada___ada__text_io__standard_in
                  ada___ada__text_io__file_system
                  ada___ada__text_io__standard_out
                  ada___ada__text_io__standard_err
                  ada___ada__text_io__current_in
                  ada___ada__text_io__current_out
                  ada___ada__text_io__current_err)) )))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 14))

(assert
;; defqtvc
 ;; File "n02.adb", line 6, characters 0-0
  (not
  (forall ((us_next_pointer_address Int) (n02__xa__assume us_rep)
  (xa__pointer_value integer) (xa__pointer_address Int)
  (xa__is_null_pointer Bool) (us_next_pointer_address1 Int)
  (n02__xb__assume us_rep) (xb__pointer_value integer)
  (xb__pointer_address Int) (xb__is_null_pointer Bool)
  (us_next_pointer_address2 Int) (n02__x__assume us_rep2)
  (x__pointer_value us_split_fields) (x__pointer_address Int)
  (x__is_null_pointer Bool))
  (=>
  (= (and (ite (and
               (not
               (= (rec__n02__data__ai__is_null_pointer n02__xa__assume) true))
               (= (rec__n02__data__ai__pointer_address n02__xa__assume) us_next_pointer_address))
          true false) (ite (= (rec__n02__data__ai__pointer_value
                              n02__xa__assume) (of_rep1 10))
                      true false)) true)
  (=>
  (= xa__pointer_value (rec__n02__data__ai__pointer_value n02__xa__assume))
  (=>
  (= xa__pointer_address (rec__n02__data__ai__pointer_address
                         n02__xa__assume))
  (=>
  (= xa__is_null_pointer (rec__n02__data__ai__is_null_pointer
                         n02__xa__assume))
  (=> (dynamic_invariant
  (us_repqtmk xa__is_null_pointer xa__pointer_address xa__pointer_value) true
  false true true)
  (=>
  (= (and (ite (and
               (not
               (= (rec__n02__data__ai__is_null_pointer n02__xb__assume) true))
               (= (rec__n02__data__ai__pointer_address n02__xb__assume) us_next_pointer_address1))
          true false) (ite (= (rec__n02__data__ai__pointer_value
                              n02__xb__assume) (of_rep1 12))
                      true false)) true)
  (=>
  (= xb__pointer_value (rec__n02__data__ai__pointer_value n02__xb__assume))
  (=>
  (= xb__pointer_address (rec__n02__data__ai__pointer_address
                         n02__xb__assume))
  (=>
  (= xb__is_null_pointer (rec__n02__data__ai__is_null_pointer
                         n02__xb__assume))
  (=> (dynamic_invariant
  (us_repqtmk xb__is_null_pointer xb__pointer_address xb__pointer_value) true
  false true true)
  (=>
  (= (and (ite (and
               (not
               (= (rec__n02__data__am__is_null_pointer n02__x__assume) true))
               (= (rec__n02__data__am__pointer_address n02__x__assume) us_next_pointer_address2))
          true false) (ite (= (rec__n02__data__am__pointer_value
                              n02__x__assume) (us_repqtmk1
                                              (us_split_fieldsqtmk
                                              (us_repqtmk xa__is_null_pointer
                                              xa__pointer_address
                                              xa__pointer_value)
                                              (us_repqtmk xb__is_null_pointer
                                              xb__pointer_address
                                              xb__pointer_value))))
                      true false)) true)
  (=>
  (= (us_repqtmk1 x__pointer_value) (rec__n02__data__am__pointer_value
                                    n02__x__assume))
  (=>
  (= x__pointer_address (rec__n02__data__am__pointer_address n02__x__assume))
  (=>
  (= x__is_null_pointer (rec__n02__data__am__is_null_pointer n02__x__assume))
  (=> (dynamic_invariant1
  (us_repqtmk2 x__is_null_pointer x__pointer_address
  (us_repqtmk1 x__pointer_value)) true false true true)
  (let ((n02__y__assume (rec__n02__data__mystruct__a x__pointer_value)))
  (forall ((y__pointer_value integer))
  (=> (= y__pointer_value (rec__n02__data__ai__pointer_value n02__y__assume))
  (=>
  (= y__pointer_address (rec__n02__data__ai__pointer_address n02__y__assume))
  (=>
  (= y__is_null_pointer (rec__n02__data__ai__is_null_pointer n02__y__assume))
  (=> (dynamic_invariant
  (us_repqtmk y__is_null_pointer y__pointer_address y__pointer_value) true
  false true true)
  (forall ((y__pointer_value1 integer))
  (=> (= y__pointer_value1 rliteral)
  (forall ((us_next_pointer_address3 Int))
  (forall ((temp___210 us_rep))
  (=>
  (= (and (ite (and
               (not
               (= (rec__n02__data__ai__is_null_pointer temp___210) true))
               (= (rec__n02__data__ai__pointer_address temp___210) us_next_pointer_address3))
          true false) (ite (= (rec__n02__data__ai__pointer_value temp___210) 
                      (of_rep1 42)) true false)) true)
  (forall ((xa__pointer_value1 integer))
  (=> (= xa__pointer_value1 (rec__n02__data__ai__pointer_value temp___210))
  (forall ((xa__pointer_address1 Int))
  (=>
  (= xa__pointer_address1 (rec__n02__data__ai__pointer_address temp___210))
  (forall ((xa__is_null_pointer1 Bool))
  (=>
  (= xa__is_null_pointer1 (rec__n02__data__ai__is_null_pointer temp___210))
  (forall ((us_next_pointer_address4 Int))
  (forall ((temp___211 us_rep))
  (=>
  (= (and (ite (and
               (not
               (= (rec__n02__data__ai__is_null_pointer temp___211) true))
               (= (rec__n02__data__ai__pointer_address temp___211) us_next_pointer_address4))
          true false) (ite (= (rec__n02__data__ai__pointer_value temp___211) 
                      (of_rep1 43)) true false)) true)
  (forall ((xb__pointer_value1 integer))
  (=> (= xb__pointer_value1 (rec__n02__data__ai__pointer_value temp___211))
  (forall ((xb__pointer_address1 Int))
  (=>
  (= xb__pointer_address1 (rec__n02__data__ai__pointer_address temp___211))
  (forall ((xb__is_null_pointer1 Bool))
  (=>
  (= xb__is_null_pointer1 (rec__n02__data__ai__is_null_pointer temp___211))
  (forall ((us_next_pointer_address5 Int))
  (forall ((temp___212 us_rep2))
  (=>
  (= (and (ite (and
               (not
               (= (rec__n02__data__am__is_null_pointer temp___212) true))
               (= (rec__n02__data__am__pointer_address temp___212) us_next_pointer_address5))
          true false) (ite (= (rec__n02__data__am__pointer_value temp___212) 
                      (us_repqtmk1
                      (us_split_fieldsqtmk
                      (us_repqtmk xa__is_null_pointer1 xa__pointer_address1
                      xa__pointer_value1)
                      (us_repqtmk xb__is_null_pointer1 xb__pointer_address1
                      xb__pointer_value1)))) true false)) true)
  (forall ((x__pointer_value1 us_split_fields))
  (=>
  (= (us_repqtmk1 x__pointer_value1) (rec__n02__data__am__pointer_value
                                     temp___212))
  (forall ((x__pointer_address1 Int))
  (=>
  (= x__pointer_address1 (rec__n02__data__am__pointer_address temp___212))
  (forall ((x__is_null_pointer1 Bool))
  (=>
  (= x__is_null_pointer1 (rec__n02__data__am__is_null_pointer temp___212))
  (forall ((o Int))
  (=> (= (to_rep1 y__pointer_value1) o)
  (forall ((o1 Int))
  (=>
  (= (to_rep1
     (rec__n02__data__ai__pointer_value
     (rec__n02__data__mystruct__b x__pointer_value1))) o1)
  (rec__n02__data__ai__pointer_value__pred
  (rec__n02__data__mystruct__a x__pointer_value1)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
