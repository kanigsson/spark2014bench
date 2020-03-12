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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__my_container__cursor__index natural)))))
(define-fun us_split_fields_rec__my_container__cursor__index__projection ((a us_split_fields)) natural 
  (rec__my_container__cursor__index a))

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
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__my_container__cursor__index
                           (us_split_fields1 a))) (to_rep
                                                  (rec__my_container__cursor__index
                                                  (us_split_fields1 b))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const my_container__cursor__index__first__bit Int)

(declare-const my_container__cursor__index__last__bit Int)

(declare-const my_container__cursor__index__position Int)

;; my_container__cursor__index__first__bit_axiom
  (assert (<= 0 my_container__cursor__index__first__bit))

;; my_container__cursor__index__last__bit_axiom
  (assert
  (< my_container__cursor__index__first__bit my_container__cursor__index__last__bit))

;; my_container__cursor__index__position_axiom
  (assert (<= 0 my_container__cursor__index__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ()
((cursor__ref (cursor__refqtmk (cursor__content us_rep)))))
(define-fun cursor__ref_cursor__content__projection ((a cursor__ref)) us_rep 
  (cursor__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-fun has_element ((Array Int natural) us_rep) Bool)

(declare-fun has_element__function_guard (Bool (Array Int natural)
  us_rep) Bool)

;; has_element__post_axiom
  (assert true)

(declare-fun element ((Array Int natural) us_rep) Int)

(declare-fun element__function_guard (Int (Array Int natural) us_rep) Bool)

;; element__post_axiom
  (assert
  (forall ((c (Array Int natural)))
  (forall ((p us_rep))
  (! (and
     (forall ((c1 (Array Int natural)) (p1 us_rep))
     (has_element__function_guard (has_element c1 p1) c1 p1))
     (=> (= (has_element c p) true)
     (let ((result (element c p)))
     (=> (element__function_guard result c p) (dynamic_invariant result true
     false true true))))) :pattern ((element c p)) ))))

(declare-fun valid (Int) Bool)

(declare-fun valid__function_guard (Bool Int) Bool)

;; valid__post_axiom
  (assert true)

(declare-fun mem ((Array Int natural) Int) Bool)

(declare-fun mem__function_guard (Bool (Array Int natural) Int) Bool)

;; mem__post_axiom
  (assert true)

(declare-fun valid1 (Int) Bool)

(declare-fun valid__function_guard1 (Bool Int) Bool)

;; valid__post_axiom
  (assert true)

(declare-fun valid2 (Int) Bool)

(declare-fun valid__function_guard2 (Bool Int) Bool)

;; valid__post_axiom
  (assert true)

(declare-fun m_has_element ((Array Int natural) Int) Bool)

(declare-fun m_has_element__function_guard (Bool (Array Int natural)
  Int) Bool)

(declare-fun m_element ((Array Int natural) Int) Int)

(declare-fun m_element__function_guard (Int (Array Int natural) Int) Bool)

(declare-fun get_model ((Array Int natural)) (Array Int natural))

(declare-fun get_model__function_guard ((Array Int natural)
  (Array Int natural)) Bool)

;; m_has_element__post_axiom
  (assert true)

;; m_element__post_axiom
  (assert
  (forall ((c (Array Int natural)))
  (forall ((p Int))
  (! (and
     (forall ((c1 (Array Int natural)) (p1 Int))
     (m_has_element__function_guard (m_has_element c1 p1) c1 p1))
     (=>
     (and (dynamic_invariant p true true true true)
     (= (m_has_element c p) true))
     (let ((result (m_element c p)))
     (=> (m_element__function_guard result c p) (dynamic_invariant result
     true false true true))))) :pattern ((m_element c p)) ))))

;; get_model__post_axiom
  (assert true)

(declare-const c1 (Array Int natural))

(declare-const p1__split_fields natural)

(declare-const c2 (Array Int natural))

(declare-const p2 Int)

(declare-const c3 (Array Int natural))

(declare-const p3 Int)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant p2 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant p3 false false true true))

(declare-const c11 (Array Int natural))

;; H
  (assert
  (forall ((c12 (Array Int natural)) (temp___268 us_rep))
  (has_element__function_guard (has_element c12 temp___268) c12 temp___268)))

;; H
  (assert
  (forall ((c12 (Array Int natural)) (temp___268 us_rep))
  (element__function_guard (element c12 temp___268) c12 temp___268)))

;; H
  (assert (forall ((e Int)) (valid__function_guard (valid e) e)))

;; H
  (assert
  (forall ((temp___268 us_rep))
  (=> (= (has_element c11 temp___268) true)
  (= (valid (element c11 temp___268)) true))))

;; H
  (assert true)

;; H
  (assert
  (forall ((p1__split_fields1 natural) (c12 (Array Int natural)))
  (has_element__function_guard
  (has_element c12 (us_repqtmk (us_split_fieldsqtmk p1__split_fields1))) c12
  (us_repqtmk (us_split_fieldsqtmk p1__split_fields1)))))

;; Assume
  (assert
  (= (has_element c11 (us_repqtmk (us_split_fieldsqtmk p1__split_fields))) true))

(define-fun o () us_rep (us_repqtmk (us_split_fieldsqtmk p1__split_fields)))

;; H
  (assert
  (forall ((c12 (Array Int natural)) (o1 us_rep))
  (has_element__function_guard (has_element c12 o1) c12 o1)))

(assert
;; defqtvc
 ;; File "test_containers.adb", line 4, characters 0-0
  (not (= (has_element c11 o) true)))
(check-sat)
