(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort length_type 0)

(declare-fun length_typeqtint (length_type) Int)

;; length_type'axiom
  (assert
  (forall ((i length_type))
  (and (<= 0 (length_typeqtint i)) (<= (length_typeqtint i) 100))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (length_type length_type) Bool)

(declare-const dummy1 length_type)

(declare-datatypes ()
((length_type__ref (length_type__refqtmk (length_type__content length_type)))))
(define-fun length_type__ref_length_type__content__projection ((a length_type__ref)) length_type 
  (length_type__content a))

(define-fun to_rep1 ((x length_type)) Int (length_typeqtint x))

(declare-fun of_rep1 (Int) length_type)

;; inversion_axiom
  (assert
  (forall ((x length_type))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x length_type)) (! (in_range1
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int natural)) (b (Array Int natural)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const dummy2 (Array Int natural))

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

(declare-fun user_eq2 ((Array Int natural) (Array Int natural)) Bool)

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__stacks__stack__top length_type)(rec__stacks__stack__content (Array Int natural))))))
(define-fun us_split_fields_rec__stacks__stack__top__projection ((a us_split_fields)) length_type 
  (rec__stacks__stack__top a))

(define-fun us_split_fields_rec__stacks__stack__content__projection ((a us_split_fields)) (Array Int natural) 
  (rec__stacks__stack__content a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__stacks__stack__top (us_split_fields1 a))) 
                        (to_rep1
                        (rec__stacks__stack__top (us_split_fields1 b))))
                        (= (bool_eq
                           (rec__stacks__stack__content (us_split_fields1 a))
                           1 100
                           (rec__stacks__stack__content (us_split_fields1 b))
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

(declare-const stacks__stack__top__first__bit Int)

(declare-const stacks__stack__top__last__bit Int)

(declare-const stacks__stack__top__position Int)

;; stacks__stack__top__first__bit_axiom
  (assert (<= 0 stacks__stack__top__first__bit))

;; stacks__stack__top__last__bit_axiom
  (assert (< stacks__stack__top__first__bit stacks__stack__top__last__bit))

;; stacks__stack__top__position_axiom
  (assert (<= 0 stacks__stack__top__position))

(declare-const stacks__stack__content__first__bit Int)

(declare-const stacks__stack__content__last__bit Int)

(declare-const stacks__stack__content__position Int)

;; stacks__stack__content__first__bit_axiom
  (assert (<= 0 stacks__stack__content__first__bit))

;; stacks__stack__content__last__bit_axiom
  (assert
  (< stacks__stack__content__first__bit stacks__stack__content__last__bit))

;; stacks__stack__content__position_axiom
  (assert (<= 0 stacks__stack__content__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ()
((stack__ref (stack__refqtmk (stack__content us_rep)))))
(define-fun stack__ref_stack__content__projection ((a stack__ref)) us_rep 
  (stack__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const e Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun is_full (us_rep) Bool)

(declare-fun is_full__function_guard (Bool us_rep) Bool)

;; is_full__post_axiom
  (assert true)

;; is_full__def_axiom
  (assert
  (forall ((s us_rep))
  (! (= (= (is_full s) true)
     (<= 100 (to_rep1 (rec__stacks__stack__top (us_split_fields1 s))))) :pattern (
  (is_full s)) )))

(declare-fun peek (us_rep) Int)

(declare-fun peek__function_guard (Int us_rep) Bool)

;; peek__post_axiom
  (assert
  (forall ((s us_rep))
  (! (let ((result (peek s)))
     (=> (peek__function_guard result s) (dynamic_invariant result true false
     true true))) :pattern ((peek s)) )))

;; peek__def_axiom
  (assert
  (forall ((s us_rep))
  (! (= (peek s) (ite (let ((temp___189 (to_rep1
                                        (rec__stacks__stack__top
                                        (us_split_fields1 s)))))
                      (and (<= 1 temp___189) (<= temp___189 100)))
                 (to_rep
                 (let ((temp___188 (rec__stacks__stack__content
                                   (us_split_fields1 s))))
                 (select temp___188 (to_rep1
                                    (rec__stacks__stack__top
                                    (us_split_fields1 s))))))
                 0)) :pattern ((peek s)) )))

(declare-sort t5s 0)

(declare-fun t5sqtint (t5s) Int)

;; t5s'axiom
  (assert (forall ((i t5s)) (and (<= 1 (t5sqtint i)) (<= (t5sqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq4 (t5s t5s) Bool)

(declare-const dummy4 t5s)

(declare-datatypes () ((t5s__ref (t5s__refqtmk (t5s__content t5s)))))
(define-fun t5s__ref_t5s__content__projection ((a t5s__ref)) t5s (t5s__content
                                                                 a))

(define-fun dynamic_invariant1 ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 0 100)) (in_range1 temp___expr_161)))

(declare-const s__split_fields us_split_fields)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant e true false true true))

;; H
  (assert
  (forall ((s__split_fields1 us_split_fields)) (is_full__function_guard
  (is_full (us_repqtmk s__split_fields1)) (us_repqtmk s__split_fields1))))

;; Assume
  (assert (not (= (is_full (us_repqtmk s__split_fields)) true)))

(declare-const o Int)

;; Ensures
  (assert (= (to_rep1 (rec__stacks__stack__top s__split_fields)) o))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (<= 100 o) true false)))

;; H
  (assert (= spark__branch true))

(assert
;; defqtvc
 ;; File "stacks.ads", line 6, characters 0-0
  (not false))
(check-sat)
