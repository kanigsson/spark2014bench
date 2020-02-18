;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(declare-fun get_current_id (us_private us_private) Int)

(declare-fun get_current_id__function_guard (Int us_private us_private) Bool)

(declare-sort id_index 0)

(declare-fun id_indexqtint (id_index) Int)

;; id_index'axiom
  (assert
  (forall ((i id_index))
  (and (<= 1 (id_indexqtint i)) (<= (id_indexqtint i) 10))))

(define-fun in_range ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (id_index id_index) Bool)

(declare-const dummy id_index)

(declare-datatypes ((id_index__ref 0))
(((id_index__refqtmk (id_index__content id_index)))))
(define-fun id_index__ref_id_index__content__projection ((a id_index__ref)) id_index 
  (id_index__content a))

(define-fun dynamic_invariant ((temp___expr_181 Int)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (or (= temp___is_init_177 true)
                                     (<= 1 10)) (in_range temp___expr_181)))

;; get_current_id__post_axiom
  (assert
  (forall ((entities__current_id us_private)
  (entities__current_cycles us_private))
  (! (let ((result (get_current_id entities__current_id
                   entities__current_cycles)))
     (=> (get_current_id__function_guard result entities__current_id
     entities__current_cycles) (dynamic_invariant result true false true
     true))) :pattern ((get_current_id entities__current_id
                       entities__current_cycles)) )))

(declare-fun get_current_cycles (us_private us_private) Int)

(declare-fun get_current_cycles__function_guard (Int us_private
  us_private) Bool)

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

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

;; get_current_cycles__post_axiom
  (assert
  (forall ((entities__current_id us_private)
  (entities__current_cycles us_private))
  (! (let ((result (get_current_cycles entities__current_id
                   entities__current_cycles)))
     (=> (get_current_cycles__function_guard result entities__current_id
     entities__current_cycles) (dynamic_invariant1 result true false true
     true))) :pattern ((get_current_cycles entities__current_id
                       entities__current_cycles)) )))

(assert
;; defqtvc
 ;; File "main.adb", line 3, characters 0-0
  (not
  (forall ((current_id us_private) (current_cycles us_private))
  (=>
  (forall ((current_id1 us_private) (current_cycles1 us_private))
  (get_current_id__function_guard
  (get_current_id current_id1 current_cycles1) current_id1 current_cycles1))
  (=> (= (get_current_id current_id current_cycles) 1)
  (=>
  (forall ((current_id1 us_private) (current_cycles1 us_private))
  (get_current_cycles__function_guard
  (get_current_cycles current_id1 current_cycles1) current_id1
  current_cycles1))
  (=> (= (get_current_cycles current_id current_cycles) 2147483647)
  (=>
  (forall ((current_id1 us_private) (current_cycles1 us_private))
  (get_current_id__function_guard
  (get_current_id current_id1 current_cycles1) current_id1 current_cycles1))
  (= (get_current_id current_id current_cycles) 1)))))))))
(check-sat)