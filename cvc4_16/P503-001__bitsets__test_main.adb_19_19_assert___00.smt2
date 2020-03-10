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

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int Bool))))))
(declare-fun slide ((Array Int Bool) Int Int) (Array Int Bool))

;; slide_eq
  (assert
  (forall ((a (Array Int Bool)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int Bool)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int Bool)) (a__first Int) (a__last Int)
  (b (Array Int Bool)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (ite (select a temp___idx_154) 1 0) (ite (select b (+ (- b__first a__first) temp___idx_154)) 1 0)))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int Bool)) (b (Array Int Bool)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (ite (select a temp___idx_154) 1 0) (ite (select b (+ (- b__first a__first) temp___idx_154)) 1 0)))))))))

(declare-fun mem ((Array Int Bool) Int) Bool)

(declare-fun mem__function_guard (Bool (Array Int Bool) Int) Bool)

(declare-sort element 0)

(declare-fun elementqtint (element) Int)

;; element'axiom
  (assert
  (forall ((i element))
  (and (<= 1 (elementqtint i)) (<= (elementqtint i) 10))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (element element) Bool)

(declare-const dummy element)

(declare-datatypes ((element__ref 0))
(((element__refqtmk (element__content element)))))
(define-fun element__ref_element__content__projection ((a element__ref)) element 
  (element__content a))

(define-fun dynamic_invariant ((temp___expr_186 Int)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=>
                                     (or (= temp___is_init_182 true)
                                     (<= 1 10)) (in_range1 temp___expr_186)))

;; mem__post_axiom
  (assert true)

;; mem__def_axiom
  (assert
  (forall ((s (Array Int Bool)))
  (forall ((e Int))
  (! (= (= (mem s e) true) (= (select s e) true)) :pattern ((mem s e)) ))))

(declare-fun empty (tuple0) (Array Int Bool))

(declare-fun empty__function_guard ((Array Int Bool) tuple0) Bool)

;; empty__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (empty us_void_param)))
     (and
     (forall ((result1 (Array Int Bool)) (elt Int)) (mem__function_guard
     (mem result1 elt) result1 elt))
     (=> (empty__function_guard result us_void_param)
     (forall ((elt Int))
     (=> (and (<= 1 elt) (<= elt 10)) (not (= (mem result elt) true))))))) :pattern (
  (empty us_void_param)) )))

(declare-fun add ((Array Int Bool) Int) (Array Int Bool))

(declare-fun add__function_guard ((Array Int Bool) (Array Int Bool)
  Int) Bool)

(declare-fun ext_equal ((Array Int Bool) (Array Int Bool)) Bool)

(declare-fun ext_equal__function_guard (Bool (Array Int Bool)
  (Array Int Bool)) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

;; add__post_axiom
  (assert
  (forall ((s (Array Int Bool)))
  (forall ((e Int))
  (! (=> (dynamic_invariant e true true true true)
     (let ((result (add s e)))
     (and
     (forall ((result1 (Array Int Bool)) (elt Int)) (mem__function_guard
     (mem result1 elt) result1 elt))
     (and
     (forall ((s1 (Array Int Bool)) (elt Int)) (mem__function_guard
     (mem s1 elt) s1 elt))
     (=> (add__function_guard result s e)
     (forall ((elt Int))
     (=> (and (<= 1 elt) (<= elt 10))
     (= (= (mem result elt) true) (=> (not (= elt e)) (= (mem s elt) true)))))))))) :pattern (
  (add s e)) ))))

;; ext_equal__post_axiom
  (assert true)

;; ext_equal__def_axiom
  (assert
  (forall ((a (Array Int Bool)) (b (Array Int Bool)))
  (! (and
     (forall ((a1 (Array Int Bool)) (elt Int)) (mem__function_guard
     (mem a1 elt) a1 elt))
     (and
     (forall ((b1 (Array Int Bool)) (elt Int)) (mem__function_guard
     (mem b1 elt) b1 elt))
     (= (= (ext_equal a b) true)
     (forall ((elt Int))
     (=> (and (<= 1 elt) (<= elt 10))
     (= (= (mem a elt) true) (= (mem b elt) true))))))) :pattern ((ext_equal
                                                                  a b)) )))

(assert
;; defqtvc
 ;; File "test_main.adb", line 3, characters 0-0
  (not
  (let ((o (empty Tuple0)))
  (=>
  (forall ((o1 (Array Int Bool)) (elt Int)) (mem__function_guard (mem o1 elt)
  o1 elt))
  (=>
  (and (empty__function_guard o Tuple0)
  (forall ((elt Int))
  (=> (and (<= 1 elt) (<= elt 10)) (not (= (mem o elt) true)))))
  (forall ((s (Array Int Bool)))
  (=> (= s o)
  (forall ((s1 (Array Int Bool)))
  (=> (forall ((s2 (Array Int Bool))) (add__function_guard (add s2 8) s2 8))
  (=> (forall ((s2 (Array Int Bool))) (add__function_guard (add s2 8) s2 8))
  (=>
  (forall ((s2 (Array Int Bool)) (s3 (Array Int Bool)))
  (ext_equal__function_guard (ext_equal s3 (add s2 8)) s3 (add s2 8)))
  (=> (= (ext_equal s1 (add s 8)) true)
  (forall ((s2 (Array Int Bool)))
  (=> (forall ((s3 (Array Int Bool))) (add__function_guard (add s3 3) s3 3))
  (=> (forall ((s3 (Array Int Bool))) (add__function_guard (add s3 3) s3 3))
  (=>
  (forall ((s3 (Array Int Bool)) (s4 (Array Int Bool)))
  (ext_equal__function_guard (ext_equal s4 (add s3 3)) s4 (add s3 3)))
  (=> (= (ext_equal s2 (add s1 3)) true)
  (=> (forall ((s3 (Array Int Bool))) (mem__function_guard (mem s3 3) s3 3))
  (=> (= (mem s2 3) true)
  (=> (forall ((s3 (Array Int Bool))) (mem__function_guard (mem s3 8) s3 8))
  (=> (= (mem s2 8) true)
  (=> (forall ((s3 (Array Int Bool))) (mem__function_guard (mem s3 1) s3 1))
  (=> (not (= (mem s2 1) true))
  (=> (forall ((s3 (Array Int Bool))) (mem__function_guard (mem s3 2) s3 2))
  (=> (not (= (mem s2 2) true))
  (=> (forall ((s3 (Array Int Bool))) (mem__function_guard (mem s3 4) s3 4))
  (=> (not (= (mem s2 4) true))
  (=> (forall ((s3 (Array Int Bool))) (mem__function_guard (mem s3 5) s3 5))
  (=> (not (= (mem s2 5) true))
  (=> (forall ((s3 (Array Int Bool))) (mem__function_guard (mem s3 6) s3 6))
  (=> (not (= (mem s2 6) true))
  (=> (forall ((s3 (Array Int Bool))) (mem__function_guard (mem s3 7) s3 7))
  (=> (not (= (mem s2 7) true))
  (=> (forall ((s3 (Array Int Bool))) (mem__function_guard (mem s3 9) s3 9))
  (not (= (mem s2 9) true))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
