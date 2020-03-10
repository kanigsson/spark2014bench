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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep 0)

(declare-fun bool_eq (us_rep us_rep) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((cursor__ref 0))
(((cursor__refqtmk (cursor__content us_rep)))))
(define-fun cursor__ref_cursor__content__2__projection ((a cursor__ref)) us_rep 
  (cursor__content a))

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content us_rep)))))
(define-fun element_type__ref_element_type__content__9__projection ((a element_type__ref)) us_rep 
  (element_type__content a))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep1 0)

(declare-fun bool_eq1 (us_rep1 us_rep1) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep1)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep1 
  (sequence__content a))

(declare-fun get (us_rep1 Int) us_rep)

(declare-fun get__function_guard (us_rep us_rep1 Int) Bool)

(declare-fun length (us_rep1) Int)

(declare-fun length__function_guard (Int us_rep1) Bool)

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

;; length__post_axiom
  (assert
  (forall ((s us_rep1)) (! (in_range1 (length s)) :pattern ((length s)) )))

(declare-const s1 us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const s2 us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun oeq (us_rep1 us_rep1) Bool)

(declare-fun oeq__function_guard (Bool us_rep1 us_rep1) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep1) (b us_rep1))
  (! (and
     (forall ((a1 us_rep1) (b1 us_rep1)) (oeq__function_guard (oeq a1 b1) a1
     b1)) (= (user_eq2 a b) (oeq a b))) :pattern ((user_eq2 a b)) )))

;; oeq__def_axiom
  (assert
  (forall ((s11 us_rep1) (s21 us_rep1))
  (! (and (forall ((s12 us_rep1)) (length__function_guard (length s12) s12))
     (and (forall ((s22 us_rep1)) (length__function_guard (length s22) s22))
     (and (forall ((s12 us_rep1)) (length__function_guard (length s12) s12))
     (and
     (forall ((s12 us_rep1) (n Int)) (get__function_guard (get s12 n) s12 n))
     (and
     (forall ((s22 us_rep1) (n Int)) (get__function_guard (get s22 n) s22 n))
     (= (= (oeq s11 s21) true)
     (and (= (length s11) (length s21))
     (forall ((n Int))
     (=> (and (<= 0 n) (<= n (- (length s11) 1)))
     (= (bool_eq (get s11 n) (get s21 n)) true)))))))))) :pattern ((oeq s11
                                                                   s21)) )))

(assert
;; defqtvc
 ;; File "functional_sequences.ads", line 14, characters 0-0
  (not
  (let ((o s2))
  (let ((o1 (length o)))
  (=>
  (and (length__function_guard o1 o) (dynamic_invariant o1 true false true
  true))
  (let ((o2 s1))
  (let ((o3 (length o2)))
  (=>
  (and (length__function_guard o3 o2) (dynamic_invariant o3 true false true
  true))
  (=> (= o3 o1)
  (let ((o4 s1))
  (let ((o5 (length o4)))
  (=>
  (and (length__function_guard o5 o4) (dynamic_invariant o5 true false true
  true)) (in_range1 (- o5 1))))))))))))))
(check-sat)
(exit)
