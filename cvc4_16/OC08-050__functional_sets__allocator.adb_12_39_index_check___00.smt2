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

(declare-sort status 0)

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (status status) Bool)

(declare-const dummy status)

(declare-datatypes ((status__ref 0))
(((status__refqtmk (status__content status)))))
(define-fun status__ref_status__content__projection ((a status__ref)) status 
  (status__content a))

(declare-fun to_rep (status) Int)

(declare-fun of_rep (Int) status)

;; inversion_axiom
  (assert
  (forall ((x status)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x status)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int status))))))
(declare-fun slide ((Array Int status) Int Int) (Array Int status))

;; slide_eq
  (assert
  (forall ((a (Array Int status)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int status)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int status)) (a__first Int) (a__last Int)
  (b (Array Int status)) (b__first Int)
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
  (forall ((a (Array Int status)) (b (Array Int status)))
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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const res Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort resource 0)

(declare-fun resourceqtint (resource) Int)

;; resource'axiom
  (assert
  (forall ((i resource))
  (and (<= 0 (resourceqtint i)) (<= (resourceqtint i) 3))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (resource resource) Bool)

(declare-const dummy1 resource)

(declare-datatypes ((resource__ref 0))
(((resource__refqtmk (resource__content resource)))))
(define-fun resource__ref_resource__content__projection ((a resource__ref)) resource 
  (resource__content a))

(define-fun dynamic_invariant ((temp___expr_178 Int)
  (temp___is_init_174 Bool) (temp___skip_constant_175 Bool)
  (temp___do_toplevel_176 Bool)
  (temp___do_typ_inv_177 Bool)) Bool (=>
                                     (or (= temp___is_init_174 true)
                                     (<= 0 3)) (in_range1 temp___expr_178)))

(declare-sort valid_resource 0)

(declare-fun valid_resourceqtint (valid_resource) Int)

;; valid_resource'axiom
  (assert
  (forall ((i valid_resource))
  (and (<= 1 (valid_resourceqtint i)) (<= (valid_resourceqtint i) 3))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (valid_resource valid_resource) Bool)

(declare-const dummy2 valid_resource)

(declare-datatypes ((valid_resource__ref 0))
(((valid_resource__refqtmk (valid_resource__content valid_resource)))))
(define-fun valid_resource__ref_valid_resource__content__projection ((a valid_resource__ref)) valid_resource 
  (valid_resource__content a))

(define-fun dynamic_invariant1 ((temp___expr_192 Int)
  (temp___is_init_188 Bool) (temp___skip_constant_189 Bool)
  (temp___do_toplevel_190 Bool)
  (temp___do_typ_inv_191 Bool)) Bool (=>
                                     (or (= temp___is_init_188 true)
                                     (<= 0 1)) (in_range temp___expr_192)))

(define-fun dynamic_invariant2 ((temp___expr_185 Int)
  (temp___is_init_181 Bool) (temp___skip_constant_182 Bool)
  (temp___do_toplevel_183 Bool)
  (temp___do_typ_inv_184 Bool)) Bool (=>
                                     (or (= temp___is_init_181 true)
                                     (<= 1 3)) (in_range2 temp___expr_185)))

(assert
;; defqtvc
 ;; File "allocator.ads", line 18, characters 0-0
  (not
  (=> (dynamic_invariant res true false true true)
  (=> (not (= res 0)) (<= 1 res)))))
(check-sat)
(exit)
