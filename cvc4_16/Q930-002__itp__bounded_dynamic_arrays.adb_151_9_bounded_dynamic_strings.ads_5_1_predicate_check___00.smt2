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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

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

(declare-fun user_eq (positive positive) Bool)

(declare-const dummy positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort character 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (character character) Bool)

(declare-const dummy1 character)

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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range3 f)
     (=> (in_range3 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range3 low)
                   (and (in_range3 high)
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

(declare-sort natural_index 0)

(declare-fun natural_indexqtint (natural_index) Int)

;; natural_index'axiom
  (assert
  (forall ((i natural_index))
  (and (<= 0 (natural_indexqtint i)) (<= (natural_indexqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (natural_index natural_index) Bool)

(declare-const dummy4 natural_index)

(declare-datatypes ((natural_index__ref 0))
(((natural_index__refqtmk (natural_index__content natural_index)))))
(define-fun natural_index__ref_natural_index__content__projection ((a natural_index__ref)) natural_index 
  (natural_index__content a))

(define-fun to_rep2 ((x natural_index)) Int (natural_indexqtint x))

(declare-fun of_rep2 (Int) natural_index)

;; inversion_axiom
  (assert
  (forall ((x natural_index))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x natural_index)) (! (in_range4
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((t49s__ref 0))
(((t49s__refqtmk (t49s__content us_t)))))
(define-fun t49s__ref_t49s__content__projection ((a t49s__ref)) us_t 
  (t49s__content a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__bounded_dynamic_strings__sequence__capacity natural_index)))))
(define-fun us_split_discrs_rec__bounded_dynamic_strings__sequence__capacity__projection ((a us_split_discrs)) natural_index 
  (rec__bounded_dynamic_strings__sequence__capacity a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__bounded_dynamic_strings__sequence__current_length natural_index)(rec__bounded_dynamic_strings__sequence__content us_t)))))
(define-fun us_split_fields_rec__bounded_dynamic_strings__sequence__current_length__projection ((a us_split_fields)) natural_index 
  (rec__bounded_dynamic_strings__sequence__current_length a))

(define-fun us_split_fields_rec__bounded_dynamic_strings__sequence__content__projection ((a us_split_fields)) us_t 
  (rec__bounded_dynamic_strings__sequence__content a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep2
                           (rec__bounded_dynamic_strings__sequence__capacity
                           (us_split_discrs1 a))) (to_rep2
                                                  (rec__bounded_dynamic_strings__sequence__capacity
                                                  (us_split_discrs1 b))))
                        (and
                        (= (to_rep2
                           (rec__bounded_dynamic_strings__sequence__current_length
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__bounded_dynamic_strings__sequence__current_length
                                                  (us_split_fields1 b))))
                        (= (bool_eq1
                           (rec__bounded_dynamic_strings__sequence__content
                           (us_split_fields1 a))
                           (rec__bounded_dynamic_strings__sequence__content
                           (us_split_fields1 b))) true)))
                   true false))

(define-fun in_range5 ((rec__bounded_dynamic_strings__sequence__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__bounded_dynamic_strings__sequence__capacity1 
  (to_rep2 (rec__bounded_dynamic_strings__sequence__capacity a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const bounded_dynamic_strings__sequence__capacity__first__bit Int)

(declare-const bounded_dynamic_strings__sequence__capacity__last__bit Int)

(declare-const bounded_dynamic_strings__sequence__capacity__position Int)

;; bounded_dynamic_strings__sequence__capacity__first__bit_axiom
  (assert (<= 0 bounded_dynamic_strings__sequence__capacity__first__bit))

;; bounded_dynamic_strings__sequence__capacity__last__bit_axiom
  (assert
  (< bounded_dynamic_strings__sequence__capacity__first__bit bounded_dynamic_strings__sequence__capacity__last__bit))

;; bounded_dynamic_strings__sequence__capacity__position_axiom
  (assert (<= 0 bounded_dynamic_strings__sequence__capacity__position))

(declare-const bounded_dynamic_strings__sequence__current_length__first__bit Int)

(declare-const bounded_dynamic_strings__sequence__current_length__last__bit Int)

(declare-const bounded_dynamic_strings__sequence__current_length__position Int)

;; bounded_dynamic_strings__sequence__current_length__first__bit_axiom
  (assert
  (<= 0 bounded_dynamic_strings__sequence__current_length__first__bit))

;; bounded_dynamic_strings__sequence__current_length__last__bit_axiom
  (assert
  (< bounded_dynamic_strings__sequence__current_length__first__bit bounded_dynamic_strings__sequence__current_length__last__bit))

;; bounded_dynamic_strings__sequence__current_length__position_axiom
  (assert (<= 0 bounded_dynamic_strings__sequence__current_length__position))

(declare-const bounded_dynamic_strings__sequence__content__first__bit Int)

(declare-const bounded_dynamic_strings__sequence__content__last__bit Int)

(declare-const bounded_dynamic_strings__sequence__content__position Int)

;; bounded_dynamic_strings__sequence__content__first__bit_axiom
  (assert (<= 0 bounded_dynamic_strings__sequence__content__first__bit))

;; bounded_dynamic_strings__sequence__content__last__bit_axiom
  (assert
  (< bounded_dynamic_strings__sequence__content__first__bit bounded_dynamic_strings__sequence__content__last__bit))

;; bounded_dynamic_strings__sequence__content__position_axiom
  (assert (<= 0 bounded_dynamic_strings__sequence__content__position))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep 
  (sequence__content a))

(declare-fun length2 (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_258 us_rep)
  (temp___is_init_254 Bool) (temp___skip_constant_255 Bool)
  (temp___do_toplevel_256 Bool)
  (temp___do_typ_inv_257 Bool)) Bool (and
                                     (=> (= temp___do_toplevel_256 true)
                                     (let ((temp___260 (to_rep2
                                                       (rec__bounded_dynamic_strings__sequence__current_length
                                                       (us_split_fields1
                                                       temp___expr_258)))))
                                     (and (<= 0 temp___260)
                                     (<= temp___260 (to_rep2
                                                    (rec__bounded_dynamic_strings__sequence__capacity
                                                    (us_split_discrs1
                                                    temp___expr_258)))))))
                                     (let ((temp___261 (rec__bounded_dynamic_strings__sequence__capacity
                                                       (us_split_discrs1
                                                       temp___expr_258))))
                                     (and (dynamic_property 1
                                     (to_rep2 temp___261)
                                     (first1
                                     (rec__bounded_dynamic_strings__sequence__content
                                     (us_split_fields1 temp___expr_258)))
                                     (last1
                                     (rec__bounded_dynamic_strings__sequence__content
                                     (us_split_fields1 temp___expr_258))))
                                     (and
                                     (= (first1
                                        (rec__bounded_dynamic_strings__sequence__content
                                        (us_split_fields1 temp___expr_258))) 1)
                                     (= (last1
                                        (rec__bounded_dynamic_strings__sequence__content
                                        (us_split_fields1 temp___expr_258))) 
                                     (to_rep2 temp___261)))))))

(define-fun dynamic_predicate ((temp___263 us_rep)) Bool (let ((temp___265 
                                                         (to_rep2
                                                         (rec__bounded_dynamic_strings__sequence__current_length
                                                         (us_split_fields1
                                                         temp___263)))))
                                                         (and
                                                         (<= 0 temp___265)
                                                         (<= temp___265 
                                                         (to_rep2
                                                         (rec__bounded_dynamic_strings__sequence__capacity
                                                         (us_split_discrs1
                                                         temp___263)))))))

(define-fun dynamic_invariant1 ((temp___expr_244 Int)
  (temp___is_init_240 Bool) (temp___skip_constant_241 Bool)
  (temp___do_toplevel_242 Bool)
  (temp___do_typ_inv_243 Bool)) Bool (=>
                                     (or (= temp___is_init_240 true)
                                     (<= 0 2147483647)) (in_range4
                                     temp___expr_244)))

;; length__post_axiom
  (assert
  (forall ((this us_rep))
  (! (=> (dynamic_invariant this true true true true)
     (let ((result (length2 this)))
     (=> (length__function_guard result this) (dynamic_invariant1 result true
     false true true)))) :pattern ((length2 this)) )))

;; length__def_axiom
  (assert
  (forall ((this us_rep))
  (! (=> (dynamic_invariant this true true true true)
     (= (length2 this) (to_rep2
                       (rec__bounded_dynamic_strings__sequence__current_length
                       (us_split_fields1 this))))) :pattern ((length2 this)) )))

(declare-datatypes ((list__ref 0))
(((list__refqtmk (list__content us_t)))))
(define-fun list__ref_list__content__projection ((a list__ref)) us_t 
  (list__content a))

(declare-fun value (us_rep) us_t)

(declare-fun value__function_guard (us_t us_rep) Bool)

(declare-fun empty (us_rep) Bool)

(declare-fun empty__function_guard (Bool us_rep) Bool)

(declare-datatypes ((t60s__ref 0))
(((t60s__refqtmk (t60s__content us_t)))))
(define-fun t60s__ref_t60s__content__projection ((a t60s__ref)) us_t 
  (t60s__content a))

(define-fun dynamic_invariant2 ((temp___expr_228 us_t)
  (temp___is_init_224 Bool) (temp___skip_constant_225 Bool)
  (temp___do_toplevel_226 Bool)
  (temp___do_typ_inv_227 Bool)) Bool (=>
                                     (not (= temp___skip_constant_225 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_228)
                                     (last1 temp___expr_228))))

;; value__post_axiom
  (assert
  (forall ((this us_rep))
  (! (=> (dynamic_invariant this true true true true)
     (let ((result (value this)))
     (and
     (forall ((this1 us_rep)) (length__function_guard (length2 this1) this1))
     (and
     (forall ((this1 us_rep)) (length__function_guard (length2 this1) this1))
     (and
     (forall ((this1 us_rep)) (length__function_guard (length2 this1) this1))
     (and
     (forall ((this1 us_rep)) (empty__function_guard (empty this1) this1))
     (=> (value__function_guard result this)
     (and
     (and
     (and (and (= (length1 result) (length2 this)) (= (first1 result) 1))
     (= (last1 result) (length2 this)))
     (= (< 0 (length2 this)) (not (= (empty this) true))))
     (dynamic_invariant2 result true false true true))))))))) :pattern (
  (value this)) )))

;; value__def_axiom
  (assert
  (forall ((this us_rep))
  (! (=> (dynamic_invariant this true true true true)
     (= (value this) (let ((temp___311 (let ((temp___309 (to_rep2
                                                         (rec__bounded_dynamic_strings__sequence__current_length
                                                         (us_split_fields1
                                                         this)))))
                                       (let ((temp___308 1))
                                       (let ((temp___310 (rec__bounded_dynamic_strings__sequence__content
                                                         (us_split_fields1
                                                         this))))
                                       (of_array (to_array temp___310)
                                       temp___308 temp___309))))))
                     (of_array (to_array temp___311) (first1 temp___311)
                     (last1 temp___311))))) :pattern ((value this)) )))

(declare-const tail us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const to____split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const i52s us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const new_length Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const r130b Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index))
  (and (<= 1 (indexqtint i)) (<= (indexqtint i) 2147483647))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (index index) Bool)

(declare-const dummy6 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun dynamic_invariant3 ((temp___expr_251 Int)
  (temp___is_init_247 Bool) (temp___skip_constant_248 Bool)
  (temp___do_toplevel_249 Bool)
  (temp___do_typ_inv_250 Bool)) Bool (=>
                                     (or (= temp___is_init_247 true)
                                     (<= 1 2147483647)) (in_range6
                                     temp___expr_251)))

(declare-datatypes ((t132b__ref 0))
(((t132b__refqtmk (t132b__content us_t)))))
(define-fun t132b__ref_t132b__content__projection ((a t132b__ref)) us_t 
  (t132b__content a))

(define-fun dynamic_invariant4 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(define-fun dynamic_invariant5 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range2 temp___expr_74)))

(define-fun dynamic_invariant6 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(define-fun dynamic_invariant7 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range3 temp___expr_18)))

;; empty__post_axiom
  (assert
  (forall ((this us_rep))
  (! (=> (dynamic_invariant this true true true true)
     (let ((result (empty this)))
     (and
     (forall ((this1 us_rep)) (length__function_guard (length2 this1) this1))
     (=> (empty__function_guard result this)
     (= (= result true) (= (length2 this) 0)))))) :pattern ((empty this)) )))

;; empty__def_axiom
  (assert
  (forall ((this us_rep))
  (! (= (= (empty this) true)
     (= (to_rep2
        (rec__bounded_dynamic_strings__sequence__current_length
        (us_split_fields1 this))) 0)) :pattern ((empty this)) )))

(assert
;; defqtvc
 ;; File "bounded_dynamic_arrays.ads", line 135, characters 0-0
  (not
  (forall ((to____split_fields us_split_fields))
  (=> (dynamic_invariant i52s true false true true)
  (=> (dynamic_invariant i52s true false true true)
  (=> (dynamic_invariant tail true false true true)
  (=> (dynamic_invariant (us_repqtmk to____split_discrs to____split_fields)
  true false true true)
  (=> (length__function_guard (length2 tail) tail)
  (=>
  (forall ((to____split_fields1 us_split_fields)) (length__function_guard
  (length2 (us_repqtmk to____split_discrs to____split_fields1))
  (us_repqtmk to____split_discrs to____split_fields1)))
  (=>
  (let ((temp___1612 (+ (length2 tail) (length2
                                       (us_repqtmk to____split_discrs
                                       to____split_fields)))))
  (and (<= 1 temp___1612)
  (<= temp___1612 (to_rep2
                  (rec__bounded_dynamic_strings__sequence__capacity
                  to____split_discrs)))))
  (forall ((o Int))
  (=>
  (= (to_rep2
     (rec__bounded_dynamic_strings__sequence__current_length
     to____split_fields)) o)
  (let ((o1 tail))
  (let ((o2 (length2 o1)))
  (=>
  (and (length__function_guard o2 o1)
  (and (dynamic_invariant1 o2 true false true true)
  (= o2 (to_rep2
        (rec__bounded_dynamic_strings__sequence__current_length
        (us_split_fields1 o1))))))
  (let ((o3 (+ o2 o)))
  (=> (in_range6 o3)
  (=> (= o3 new_length)
  (=> (dynamic_invariant3 new_length true false true true)
  (forall ((bounded_dynamic_strings__append__R130b__assume Int))
  (=>
  (= (to_rep2
     (rec__bounded_dynamic_strings__sequence__capacity to____split_discrs)) bounded_dynamic_strings__append__R130b__assume)
  (=> (= bounded_dynamic_strings__append__R130b__assume r130b)
  (=> (dynamic_invariant1 r130b true false true true)
  (let ((temp___1586 (rec__bounded_dynamic_strings__sequence__content
                     to____split_fields)))
  (forall ((temp___1581 us_t))
  (=> (forall ((o4 us_rep)) (length__function_guard (length2 o4) o4))
  (=> (forall ((o4 us_rep)) (length__function_guard (length2 o4) o4))
  (=> (forall ((o4 us_rep)) (length__function_guard (length2 o4) o4))
  (=> (forall ((o4 us_rep)) (empty__function_guard (empty o4) o4))
  (=> (forall ((o4 us_rep)) (length__function_guard (length2 o4) o4))
  (=> (forall ((o4 us_rep)) (length__function_guard (length2 o4) o4))
  (=> (forall ((o4 us_rep)) (length__function_guard (length2 o4) o4))
  (=> (forall ((o4 us_rep)) (empty__function_guard (empty o4) o4))
  (=>
  (let ((o4 tail))
  (let ((temp___1580 (value o4)))
  (and
  (and (value__function_guard temp___1580 o4)
  (and (dynamic_invariant2 temp___1580 true false true true)
  (and
  (= temp___1580 (let ((temp___298 (of_array
                                   (to_array
                                   (rec__bounded_dynamic_strings__sequence__content
                                   (us_split_fields1 o4))) 1
                                   (to_rep2
                                   (rec__bounded_dynamic_strings__sequence__current_length
                                   (us_split_fields1 o4))))))
                 (of_array (to_array temp___298) (first1 temp___298)
                 (last1 temp___298))))
  (and
  (and
  (and (= (length1 temp___1580) (length2 o4)) (= (first1 temp___1580) 1))
  (= (last1 temp___1580) (length2 o4)))
  (= (< 0 (length2 o4)) (not (= (empty o4) true)))))))
  (let ((o5 (us_repqtmk to____split_discrs to____split_fields)))
  (let ((temp___1579 (value o5)))
  (and
  (and (value__function_guard temp___1579 o5)
  (and (dynamic_invariant2 temp___1579 true false true true)
  (and
  (= temp___1579 (let ((temp___298 (of_array
                                   (to_array
                                   (rec__bounded_dynamic_strings__sequence__content
                                   to____split_fields)) 1
                                   (to_rep2
                                   (rec__bounded_dynamic_strings__sequence__current_length
                                   to____split_fields)))))
                 (of_array (to_array temp___298) (first1 temp___298)
                 (last1 temp___298))))
  (and
  (and
  (and (= (length1 temp___1579) (length2 o5)) (= (first1 temp___1579) 1))
  (= (last1 temp___1579) (length2 o5)))
  (= (< 0 (length2 o5)) (not (= (empty o5) true)))))))
  (ite (= (length1 temp___1579) 0)
  (= temp___1581 (of_array (to_array temp___1580) (first1 temp___1580)
                 (last1 temp___1580)))
  (let ((o6 (- (+ (first1 temp___1579) (+ (length (first1 temp___1579)
                                          (last1 temp___1579)) (length
                                                               (first1
                                                               temp___1580)
                                                               (last1
                                                               temp___1580)))) 1)))
  (and (in_range1 o6)
  (= temp___1581 (of_array
                 (concat1 (to_array temp___1579) (first1 temp___1579)
                 (last1 temp___1579) (to_array temp___1580)
                 (first1 temp___1580) (last1 temp___1580))
                 (first1 temp___1579) o6)))))))))))
  (=>
  (ite (<= (first1 temp___1581) (last1 temp___1581))
  (and (<= 1 new_length)
  (= (- (last1 temp___1581) (first1 temp___1581)) (- new_length 1)))
  (< new_length 1))
  (let ((temp___1582 (of_array
                     (slide (to_array temp___1581) (first1 temp___1581) 1) 1
                     new_length)))
  (let ((temp___1584 (rec__bounded_dynamic_strings__sequence__content
                     to____split_fields)))
  (=>
  (=> (<= 1 new_length)
  (and (and (<= (first1 temp___1584) 1) (<= 1 (last1 temp___1584)))
  (and (<= (first1 temp___1584) new_length)
  (<= new_length (last1 temp___1584)))))
  (let ((temp___1585 (of_array (to_array temp___1584) 1 new_length)))
  (=>
  (ite (<= (first1 temp___1582) (last1 temp___1582))
  (and (<= (first1 temp___1585) (last1 temp___1585))
  (= (- (last1 temp___1582) (first1 temp___1582)) (- (last1 temp___1585) 
  (first1 temp___1585)))) (< (last1 temp___1585) (first1 temp___1585)))
  (forall ((usf us_t))
  (=>
  (and
  (and (= (first1 temp___1586) (first1 usf))
  (= (last1 temp___1586) (last1 usf)))
  (forall ((temp___1588 Int))
  (ite (and (<= 1 temp___1588) (<= temp___1588 new_length))
  (= (select (to_array usf) temp___1588) (select (to_array temp___1582) temp___1588))
  (= (select (to_array usf) temp___1588) (select (to_array temp___1586) temp___1588)))))
  (dynamic_predicate
  (us_repqtmk to____split_discrs
  (us_split_fieldsqtmk
  (rec__bounded_dynamic_strings__sequence__current_length to____split_fields)
  usf)))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
