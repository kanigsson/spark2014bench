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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-sort length_t 0)

(declare-fun length_tqtint (length_t) Int)

;; length_t'axiom
  (assert
  (forall ((i length_t))
  (and (<= 0 (length_tqtint i)) (<= (length_tqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (length_t length_t) Bool)

(declare-const dummy1 length_t)

(declare-datatypes ((length_t__ref 0))
(((length_t__refqtmk (length_t__content length_t)))))
(define-fun length_t__ref_length_t__content__projection ((a length_t__ref)) length_t 
  (length_t__content a))

(define-fun to_rep ((x length_t)) Int (length_tqtint x))

(declare-fun of_rep (Int) length_t)

;; inversion_axiom
  (assert
  (forall ((x length_t))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x length_t)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const dummy2 (Array Int integer))

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

(declare-fun user_eq2 ((Array Int integer) (Array Int integer)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__stack__t__len length_t)(rec__stack__t__elements (Array Int integer))))))
(define-fun us_split_fields_rec__stack__t__len__projection ((a us_split_fields)) length_t 
  (rec__stack__t__len a))

(define-fun us_split_fields_rec__stack__t__elements__projection ((a us_split_fields)) (Array Int integer) 
  (rec__stack__t__elements a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep (rec__stack__t__len (us_split_fields1 a))) 
                        (to_rep (rec__stack__t__len (us_split_fields1 b))))
                        (= (bool_eq
                           (rec__stack__t__elements (us_split_fields1 a)) 1
                           100 (rec__stack__t__elements (us_split_fields1 b))
                           1 100) true))
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

(declare-const stack__t__len__first__bit Int)

(declare-const stack__t__len__last__bit Int)

(declare-const stack__t__len__position Int)

;; stack__t__len__first__bit_axiom
  (assert (<= 0 stack__t__len__first__bit))

;; stack__t__len__last__bit_axiom
  (assert (< stack__t__len__first__bit stack__t__len__last__bit))

;; stack__t__len__position_axiom
  (assert (<= 0 stack__t__len__position))

(declare-const stack__t__elements__first__bit Int)

(declare-const stack__t__elements__last__bit Int)

(declare-const stack__t__elements__position Int)

;; stack__t__elements__first__bit_axiom
  (assert (<= 0 stack__t__elements__first__bit))

;; stack__t__elements__last__bit_axiom
  (assert (< stack__t__elements__first__bit stack__t__elements__last__bit))

;; stack__t__elements__position_axiom
  (assert (<= 0 stack__t__elements__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-fun get_length (us_rep) Int)

(declare-fun get_length__function_guard (Int us_rep) Bool)

(declare-fun create_stack (tuple0) us_rep)

(declare-fun create_stack__function_guard (us_rep tuple0) Bool)

;; create_stack__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (create_stack us_void_param)))
     (and
     (forall ((result1 us_rep)) (get_length__function_guard
     (get_length result1) result1))
     (=> (create_stack__function_guard result us_void_param)
     (= (get_length result) 0)))) :pattern ((create_stack us_void_param)) )))

(declare-fun top (us_rep) Int)

(declare-fun top__function_guard (Int us_rep) Bool)

;; top__post_axiom
  (assert
  (forall ((the_stack us_rep))
  (! (and
     (forall ((the_stack1 us_rep)) (get_length__function_guard
     (get_length the_stack1) the_stack1))
     (=> (< 0 (get_length the_stack))
     (let ((result (top the_stack)))
     (=> (top__function_guard result the_stack) (dynamic_invariant result
     true false true true))))) :pattern ((top the_stack)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__private_a__optional_stack__exists Bool)(rec__private_a__optional_stack__the_stack us_rep)))))
(define-fun us_split_fields_rec__private_a__optional_stack__exists__projection ((a us_split_fields2)) Bool 
  (rec__private_a__optional_stack__exists a))

(define-fun us_split_fields_rec__private_a__optional_stack__the_stack__projection ((a us_split_fields2)) us_rep 
  (rec__private_a__optional_stack__the_stack a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (ite (rec__private_a__optional_stack__exists
                                 (us_split_fields3 a)) 1 0) (ite (rec__private_a__optional_stack__exists
                                                                 (us_split_fields3
                                                                 b)) 1 0))
                         (= (bool_eq1
                            (rec__private_a__optional_stack__the_stack
                            (us_split_fields3 a))
                            (rec__private_a__optional_stack__the_stack
                            (us_split_fields3 b))) true))
                    true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const private_a__optional_stack__exists__first__bit Int)

(declare-const private_a__optional_stack__exists__last__bit Int)

(declare-const private_a__optional_stack__exists__position Int)

;; private_a__optional_stack__exists__first__bit_axiom
  (assert (<= 0 private_a__optional_stack__exists__first__bit))

;; private_a__optional_stack__exists__last__bit_axiom
  (assert
  (< private_a__optional_stack__exists__first__bit private_a__optional_stack__exists__last__bit))

;; private_a__optional_stack__exists__position_axiom
  (assert (<= 0 private_a__optional_stack__exists__position))

(declare-const private_a__optional_stack__the_stack__first__bit Int)

(declare-const private_a__optional_stack__the_stack__last__bit Int)

(declare-const private_a__optional_stack__the_stack__position Int)

;; private_a__optional_stack__the_stack__first__bit_axiom
  (assert (<= 0 private_a__optional_stack__the_stack__first__bit))

;; private_a__optional_stack__the_stack__last__bit_axiom
  (assert
  (< private_a__optional_stack__the_stack__first__bit private_a__optional_stack__the_stack__last__bit))

;; private_a__optional_stack__the_stack__position_axiom
  (assert (<= 0 private_a__optional_stack__the_stack__position))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ((optional_stack__ref 0))
(((optional_stack__refqtmk (optional_stack__content us_rep1)))))
(define-fun optional_stack__ref_optional_stack__content__projection ((a optional_stack__ref)) us_rep1 
  (optional_stack__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (<= 0 100)) (in_range2 temp___expr_168)))

;; get_length__post_axiom
  (assert
  (forall ((the_stack us_rep))
  (! (let ((result (get_length the_stack)))
     (=> (get_length__function_guard result the_stack) (dynamic_invariant1
     result true false true true))) :pattern ((get_length the_stack)) )))

(assert
;; defqtvc
 ;; File "private_a.adb", line 49, characters 0-0
  (not
  (forall ((n Int))
  (=> (dynamic_invariant n true false true true)
  (let ((o (create_stack Tuple0)))
  (=> (forall ((o1 us_rep)) (get_length__function_guard (get_length o1) o1))
  (=> (and (create_stack__function_guard o Tuple0) (= (get_length o) 0))
  (forall ((s__split_fields us_split_fields2))
  (=> (= s__split_fields (us_split_fieldsqtmk1 (distinct 1 0) o))
  (=> (= (rec__private_a__optional_stack__exists s__split_fields) true)
  (forall ((stack__push__the_stack__fields us_split_fields))
  (=>
  (forall ((stack__push__the_stack__fields1 us_split_fields))
  (get_length__function_guard
  (get_length (us_repqtmk stack__push__the_stack__fields1))
  (us_repqtmk stack__push__the_stack__fields1)))
  (=>
  (forall ((s__split_fields1 us_split_fields2)) (get_length__function_guard
  (get_length
  (us_repqtmk
  (us_split_fields1
  (rec__private_a__optional_stack__the_stack s__split_fields1))))
  (us_repqtmk
  (us_split_fields1
  (rec__private_a__optional_stack__the_stack s__split_fields1)))))
  (=>
  (forall ((stack__push__the_stack__fields1 us_split_fields))
  (top__function_guard (top (us_repqtmk stack__push__the_stack__fields1))
  (us_repqtmk stack__push__the_stack__fields1)))
  (=>
  (and
  (= (get_length (us_repqtmk stack__push__the_stack__fields)) (+ (get_length
                                                                 (us_repqtmk
                                                                 (us_split_fields1
                                                                 (rec__private_a__optional_stack__the_stack
                                                                 s__split_fields)))) 1))
  (= (top (us_repqtmk stack__push__the_stack__fields)) n))
  (forall ((s__split_fields1 us_split_fields2))
  (=>
  (= s__split_fields1 (us_split_fieldsqtmk1
                      (rec__private_a__optional_stack__exists
                      s__split_fields)
                      (us_repqtmk stack__push__the_stack__fields)))
  (=> (forall ((o1 us_rep)) (get_length__function_guard (get_length o1) o1))
  (< 0 (get_length
       (rec__private_a__optional_stack__the_stack s__split_fields1)))))))))))))))))))))
(check-sat)
(exit)
